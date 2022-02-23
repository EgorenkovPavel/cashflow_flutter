import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/states.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

abstract class SyncEvent {}

class SyncInit extends SyncEvent {}

class CreateCloudDatabase extends SyncEvent {}

class RefreshConnection extends SyncEvent {}

class SyncNow extends SyncEvent {}

class SyncLastDay extends SyncEvent {}

class SyncLastMonth extends SyncEvent {}

class SyncAll extends SyncEvent {}

class AddUser extends SyncEvent {
  final User user;

  AddUser(this.user);
}

class AuthProgress extends SyncEvent {}

class AuthAuthenticated extends SyncEvent {
  final User user;

  AuthAuthenticated(this.user);
}

class NotAuth extends SyncEvent {}

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final AuthBloc _authBloc;
  final DataSource _dataSource;
  final PrefsRepository prefsRepository;

  StreamSubscription? _syncSub;

  SyncBloc({
    required AuthBloc authBloc,
    required DataSource dataSource,
    required this.prefsRepository,
  })  : _authBloc = authBloc,
        _dataSource = dataSource,
        super(const SyncStateNotSynced()) {
    on<SyncInit>(_init);
    on<AuthProgress>(_authProgress);
    on<AuthAuthenticated>(_authAuthenticated);
    on<NotAuth>(_notAuth);
    on<CreateCloudDatabase>(_createCloudDatabase);
    on<RefreshConnection>(_syncNow);
    on<SyncNow>(_syncNow);
    on<SyncLastDay>(_syncLastDay);
    on<SyncLastMonth>(_syncLastMonth);
    on<SyncAll>(_syncAll);
    on<AddUser>(_addUser);
  }

  FutureOr<void> _init(SyncInit event, Emitter<SyncState> emit) {
    _syncSub = _authBloc.stream.listen((event) async {
      if (event is InProgress) {
        add(AuthProgress());
      } else if (event is Authenticated) {
        add(AuthAuthenticated(event.user));
      } else {
        add(NotAuth());
      }
    });
  }

  FutureOr<void> _authProgress(AuthProgress event, Emitter<SyncState> emit) {
    emit(const SyncStateInProgress());
  }

  FutureOr<void> _authAuthenticated(
      AuthAuthenticated event, Emitter<SyncState> emit) async {
    emit(const SyncStateInProgress());
    var res = await _dataSource.users.databaseExists(event.user);

    return res.fold((success) async {
      if (success) {
        var resLogIn = await _dataSource.users.logIn(event.user);
        return resLogIn.fold((success) => add(SyncNow()), (failure) {
          emit(const SyncStateFailed());
        });
      } else {
        emit(const SyncStateNoDb());
      }
    }, (failure) {
      emit(const SyncStateFailed());
    });

  }

  FutureOr<void> _notAuth(NotAuth event, Emitter<SyncState> emit) {
    emit(const SyncStateNotSynced());
  }

  Future<void> _syncData(DateTime syncFrom, Emitter<SyncState> emit) async {
    if (_authBloc.state is! Authenticated) {
      return;
    }

    await for (var event in _dataSource.loadToCloud()) {
      emit(SyncStateLoadingToCloud(
        accountCount: event.accountCount,
        categoryCount: event.categoryCount,
        operationCount: event.operationCount,
      ));
    }

    var syncDate = DateTime.now();
    _dataSource.loadFromCloud(syncFrom).listen((event) {
      emit(SyncStateLoadingFromCloud(
        accountCount: event.accountCount,
        categoryCount: event.categoryCount,
        operationCount: event.operationCount,
      ));
    }, onDone: () {
      prefsRepository.setSyncDate(syncDate);
      emit(SyncStateSynced(syncDate: syncDate));
    }, onError: (e) {
      emit(const SyncStateNotSynced());
    });
  }

  FutureOr<void> _createCloudDatabase(CreateCloudDatabase event, Emitter<SyncState> emit) async {
    if (_authBloc.state is! Authenticated) {
      return;
    }
    emit(const SyncStateInProgress());
    var res = await _dataSource.users
        .createDatabase((_authBloc.state as Authenticated).user);
    if (res.isFailure()) {
      emit(const SyncStateFailed());
      return;
    }

    add(SyncNow());
  }

  FutureOr<void> _syncNow(SyncEvent event, Emitter<SyncState> emit) {
    _syncData(prefsRepository.syncDate.subtract(const Duration(minutes: 30)), emit);
  }

  FutureOr<void> _syncLastDay(SyncLastDay event, Emitter<SyncState> emit) {
    _syncData(prefsRepository.syncDate.subtract(const Duration(days: 1)), emit);
  }

  FutureOr<void> _syncLastMonth(SyncLastMonth event, Emitter<SyncState> emit) {
    _syncData(prefsRepository.syncDate.subtract(const Duration(days: 30)), emit);
  }

  FutureOr<void> _syncAll(SyncAll event, Emitter<SyncState> emit) {
    _syncData(DateTime.utc(1970, 1, 1), emit);
  }

  FutureOr<void> _addUser(AddUser event, Emitter<SyncState> emit) async{
    await _dataSource.users.addToDatabase(event.user);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    return super.close();
  }






}

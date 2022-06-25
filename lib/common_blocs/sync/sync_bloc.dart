import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/states.dart';
import 'package:money_tracker/data/sources/settings_source.dart';
import 'package:money_tracker/domain/interfaces/sync_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

abstract class SyncEvent extends Equatable {}

class CreateCloudDatabase extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class RefreshConnection extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class SyncNow extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class SyncLastDay extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class SyncLastMonth extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class SyncAll extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class AddUser extends SyncEvent {
  final User user;

  AddUser(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthProgress extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class AuthAuthenticated extends SyncEvent {
  final User user;

  AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [];
}

class NotAuth extends SyncEvent {
  @override
  List<Object?> get props => [];
}

class SyncData extends SyncEvent {
  final DateTime syncDate;

  SyncData(this.syncDate);

  @override
  List<Object?> get props => [syncDate];
}

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final AuthBloc _authBloc;
  final SettingsSource prefsRepository;
  final SyncRepository syncRepo;

  StreamSubscription? _syncSub;

  SyncBloc({
    required AuthBloc authBloc,
    required this.prefsRepository,
    required this.syncRepo,
  })  : _authBloc = authBloc,
        super(const SyncStateNotSynced()) {
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
    on<SyncData>(_syncData);

    _syncSub = _authBloc.stream.listen((event) async {
      if (event is Authenticated) {
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
    AuthAuthenticated event,
    Emitter<SyncState> emit,
  ) async {
    emit(const SyncStateInProgress());
    var res = await syncRepo.databaseExists(event.user);

    return res.fold(
      (success) async {
        if (success) {
          var resLogIn = await syncRepo.logIn(event.user);

          return resLogIn.fold((success) => add(SyncNow()), (failure) {
            emit(const SyncStateFailed());
          });
        } else {
          emit(const SyncStateNoDb());
        }
      },
      (failure) {
        emit(const SyncStateFailed());
      },
    );
  }

  FutureOr<void> _notAuth(NotAuth event, Emitter<SyncState> emit) {
    emit(const SyncStateNotSynced());
  }

  Future<void> _syncData(SyncData event, Emitter<SyncState> emit) async {
    if (_authBloc.state is! Authenticated) {
      return;
    }

    try {
      await for (var event in syncRepo.loadToCloud()) {
        emit(SyncStateLoadingToCloud(
          accountCount: event.accountCount,
          categoryCount: event.categoryCount,
          operationCount: event.operationCount,
        ));
      }

      var syncDate = DateTime.now();
      await for (var event in syncRepo.loadFromCloud(event.syncDate)) {
        emit(SyncStateLoadingFromCloud(
          accountCount: event.accountCount,
          categoryCount: event.categoryCount,
          operationCount: event.operationCount,
        ));
      }
      await prefsRepository.setSyncDate(syncDate);
      syncRepo.isCurrentAdmin().fold(
            (success) =>
                emit(SyncStateSynced(syncDate: syncDate, isAdmin: success)),
            (failure) =>
                emit(SyncStateSynced(syncDate: syncDate, isAdmin: false)),
          );
    } on Object catch (e, stackTrace) {
      emit(const SyncStateNotSynced());
      Error.throwWithStackTrace(Exception('Error when sync data in sync bloc'), stackTrace);
    }
  }

  FutureOr<void> _createCloudDatabase(
    CreateCloudDatabase event,
    Emitter<SyncState> emit,
  ) async {
    if (_authBloc.state is! Authenticated) {
      return;
    }
    emit(const SyncStateInProgress());
    var res =
        await syncRepo.createDatabase((_authBloc.state as Authenticated).user);
    if (res.isFailure()) {
      emit(const SyncStateFailed());

      return;
    }

    add(SyncNow());
  }

  FutureOr<void> _syncNow(SyncEvent event, Emitter<SyncState> emit) {
    add(SyncData(
      prefsRepository.syncDate.subtract(const Duration(minutes: 30)),
    ));
  }

  FutureOr<void> _syncLastDay(SyncLastDay event, Emitter<SyncState> emit) {
    add(SyncData(prefsRepository.syncDate.subtract(const Duration(days: 1))));
  }

  FutureOr<void> _syncLastMonth(SyncLastMonth event, Emitter<SyncState> emit) {
    add(SyncData(prefsRepository.syncDate.subtract(const Duration(days: 30))));
  }

  FutureOr<void> _syncAll(SyncAll event, Emitter<SyncState> emit) {
    add(SyncData(DateTime.utc(1970, 1, 1)));
  }

  FutureOr<void> _addUser(AddUser event, Emitter<SyncState> emit) async {
    final res = await syncRepo.addToDatabase(event.user);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();

    return super.close();
  }
}

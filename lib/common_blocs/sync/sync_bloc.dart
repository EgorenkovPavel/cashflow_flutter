import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/states.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

class SyncBloc extends Cubit<SyncState> {
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
    _syncSub = _authBloc.stream.listen((event) async {
      if (event is InProgress) {
        emit(const SyncStateInProgress());
      } else if (event is Authenticated) {
        if (await _logIn(event.user)) {
          await syncNow();
        }
      } else {
        emit(const SyncStateNotSynced());
      }
    });

  }

  Future<void> _syncData(DateTime syncFrom) async {
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

  Future<bool> _logIn(User user) async {
    emit(const SyncStateInProgress());
    var res = await _dataSource.users.databaseExists(user);

    return res.fold((success) async {
      if (success) {
        var resLogIn = await _dataSource.users.logIn(user);
        return resLogIn.fold((success) => true, (failure) {
          emit(const SyncStateFailed());
          return false;
        });
      } else {
        emit(const SyncStateNoDb());
        return false;
      }
    }, (failure) {
      emit(const SyncStateFailed());
      return false;
    });
  }

  Future<bool> createCloudDatabase() async {
    if (_authBloc.state is! Authenticated) {
      return false;
    }
    emit(const SyncStateInProgress());
    var res = await _dataSource.users
        .createDatabase((_authBloc.state as Authenticated).user);
    if (res.isFailure()) {
      emit(const SyncStateFailed());
      return false;
    }

    await syncNow();
    return true;
  }

  void refreshConnection() => syncNow();

  Future<void> syncNow() =>
      _syncData(prefsRepository.syncDate.subtract(const Duration(minutes: 30)));

  Future<void> syncLastDay() =>
      _syncData(prefsRepository.syncDate.subtract(const Duration(days: 1)));

  Future<void> syncLastMonth() =>
      _syncData(prefsRepository.syncDate.subtract(const Duration(days: 30)));

  Future<void> syncAll() => _syncData(DateTime.utc(1970, 1, 1));

  Future<bool> addUser(User user) async {
    var res = await _dataSource.users.addToDatabase(user);
    return res.fold((left) => false, (right) => true);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    return super.close();
  }
}

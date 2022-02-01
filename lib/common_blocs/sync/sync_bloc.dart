import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/states.dart';
import 'package:money_tracker/common_blocs/sync/syncer/syncer.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/data/remote/remote_source.dart';
import 'package:money_tracker/domain/models/user.dart';

class SyncBloc extends Cubit<SyncState> {
  final AuthBloc _authBloc;
  final LocalSource localSource;
  final RemoteSource remoteSource;
  final PrefsRepository prefsRepository;

  StreamSubscription? _syncSub;
  StreamSubscription? _adminSub;

  bool _isAdmin = false;

  final Syncer _syncer;

  SyncBloc({
    required AuthBloc authBloc,
    required this.localSource,
    required this.remoteSource,
    required this.prefsRepository,
  })  : _authBloc = authBloc,
        _syncer = Syncer(localSource: localSource, remoteSource: remoteSource),
        super(SyncState_NotSynced(isAdmin: false)) {
    _syncSub = _authBloc.stream.listen((event) async {
      if (event is InProgress) {
        emit(SyncState_InProgress());
      } else if (event is Authenticated) {
        if (await _logIn(event.user.id)) {
          await syncNow();
        }
      } else {
        emit(SyncState_NotSynced(isAdmin: _isAdmin));
      }
    });
    _adminSub = remoteSource.isAdmin().listen((event) {
      _isAdmin = event;
    });
  }

  Future<void> _syncData(DateTime syncFrom) async {
    if (_authBloc.state is! Authenticated) {
      return;
    }

    await for (var event in _syncer.loadToCloud()) {
      emit(SyncState_LoadingToCloud(
        accountCount: event.accountCount,
        categoryCount: event.categoryCount,
        operationCount: event.operationCount,
      ));
    }
    ;

    var syncDate = DateTime.now();
    _syncer.loadFromCloud(syncFrom).listen((event) {
      emit(SyncState_LoadingFromCloud(
        accountCount: event.accountCount,
        categoryCount: event.categoryCount,
        operationCount: event.operationCount,
      ));
    }, onDone: () {
      prefsRepository.setSyncDate(syncDate);
      emit(SyncState_Synced(isAdmin: _isAdmin, syncDate: syncDate));
    }, onError: (e) {
      emit(SyncState_NotSynced(isAdmin: _isAdmin));
    });
  }

  Future<bool> _logIn(String userId) async {
    emit(SyncState_InProgress());
    var res = await remoteSource.databaseExists(userId);

    return res.fold((success) async {
      if (success) {
        var resLogIn = await remoteSource.logIn(userId);
        return resLogIn.fold((success) => true, (failure) {
          emit(SyncState_Failed(isAdmin: _isAdmin));
          return false;
        });
      } else {
        emit(SyncState_NoDb());
        return false;
      }
    }, (failure) {
      emit(SyncState_Failed(isAdmin: _isAdmin));
      return false;
    });
  }

  Future<bool> createCloudDatabase() async {
    if (_authBloc.state is! Authenticated) {
      return false;
    }
    emit(SyncState_InProgress());
    var res = await remoteSource
        .createDatabase((_authBloc.state as Authenticated).user);
    if (res.isFailure()) {
      emit(SyncState_Failed(isAdmin: _isAdmin));
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
    var res = await remoteSource.addNewUser(user);
    return res.fold((left) => false, (right) => true);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    _adminSub?.cancel();
    return super.close();
  }
}

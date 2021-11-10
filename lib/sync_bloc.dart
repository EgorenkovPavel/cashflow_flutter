import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

abstract class SyncState {
  abstract final bool isAdmin;

  const SyncState();
}

class SyncState_InProgress extends SyncState {
  @override
  final bool isAdmin = false;

  const SyncState_InProgress();
}

class SyncState_LoadingToCloud extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_LoadingToCloud({required this.isAdmin});
}

class SyncState_LoadingFromCloud extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_LoadingFromCloud({required this.isAdmin});
}

class SyncState_Synced extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_Synced({required this.isAdmin});
}

class SyncState_NotSynced extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_NotSynced({required this.isAdmin});
}

class SyncState_Failed extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_Failed({required this.isAdmin});
}

class SyncState_NoDb extends SyncState {
  @override
  final bool isAdmin = false;

  const SyncState_NoDb();
}

class SyncBloc extends Cubit<SyncState> {
  final AuthBloc _authBloc;
  final DataSource dataSource;
  final PrefsRepository prefsRepository;

  StreamSubscription? _syncSub;
  StreamSubscription? _adminSub;

  bool _isAdmin = false;

  SyncBloc({
    required AuthBloc authBloc,
    required this.dataSource,
    required this.prefsRepository,
  })  : _authBloc = authBloc,
        super(SyncState_NotSynced(isAdmin: false)) {
    _syncSub = _authBloc.stream.listen((event) async {
      if (event is AuthStateInProgress) {
        emit(SyncState_InProgress());
      } else if (event is AuthStateAuthenticated) {
        if (await _logIn(event.user.id)) {
          await _syncData();
        }
      } else {
        emit(SyncState_NotSynced(isAdmin: _isAdmin));
      }
    });
    _adminSub = dataSource.isAdmin().listen((event) {
      _isAdmin = event;
    });
  }

  Future<void> _syncData() async {
    emit(SyncState_LoadingToCloud(isAdmin: _isAdmin));
    await dataSource.loadToCloud();

    emit(SyncState_LoadingFromCloud(isAdmin: _isAdmin));
    var syncDate = DateTime.now();
    if (await dataSource.loadFromCloud(prefsRepository.syncDate)) {
      await prefsRepository.setSyncDate(syncDate);
      emit(SyncState_Synced(isAdmin: _isAdmin));
    } else {
      emit(SyncState_NotSynced(isAdmin: _isAdmin));
    }
  }

  Future<bool> _logIn(String userId) async {
    emit(SyncState_InProgress());
    var res = await dataSource.cloudDbExists(userId);

    return res.fold((success) async {
      if (success) {
        var resLogIn = await dataSource.logIn(userId);
        return resLogIn.fold((success) => true, (failure) {
          emit(SyncState_Failed(isAdmin: _isAdmin));
          return false;
        });
      } else {
        emit(SyncState_NoDb());
        return false;
      }
    }, (failure){
      emit(SyncState_Failed(isAdmin: _isAdmin));
      return false;
    });
  }

  Future<bool> createCloudDatabase() async {
    if (_authBloc.state is AuthStateAuthenticated) {
      emit(SyncState_InProgress());
      var res = await dataSource.createCloudDatabase((_authBloc.state as AuthStateAuthenticated).user);
      if (res.isFailure()){
        emit(SyncState_Failed(isAdmin: _isAdmin));
        return false;
      }

      emit(SyncState_LoadingToCloud(isAdmin: _isAdmin));
      await dataSource.loadToCloud();
      await prefsRepository.setSyncDate(DateTime.now());

      emit(SyncState_Synced(isAdmin: _isAdmin));
      return true;
    }else{
      return false;
    }
  }

  void refreshConnection() {
    sync();
  }

  Future<void> sync() async {
    if (_authBloc.state is AuthStateAuthenticated) {
      await _syncData();
    }
  }

  Future<bool> addUser(User user) async {
    var res = await dataSource.addNewUser(user);
    return res.fold((left) => false, (right) => true);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    _adminSub?.cancel();
    return super.close();
  }
}

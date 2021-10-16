import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/data/prefs_repository.dart';

abstract class SyncState{
  abstract final bool isAdmin;

  const SyncState();
}

class SyncState_InProgress  extends SyncState{
  @override
  final bool isAdmin = false;

  const SyncState_InProgress();
}

class SyncState_LoadingToCloud extends SyncState{
  @override
  final bool isAdmin;

  const SyncState_LoadingToCloud({required this.isAdmin});
}

class SyncState_LoadingFlomCloud extends SyncState{
  @override
  final bool isAdmin;

  const SyncState_LoadingFlomCloud({required this.isAdmin});
}

class SyncState_Synced extends SyncState{
  @override
  final bool isAdmin;

  const SyncState_Synced({required this.isAdmin});

}

class SyncState_NotSynced extends SyncState{
  @override
  final bool isAdmin;

  const SyncState_NotSynced({required this.isAdmin});
}

class SyncState_Failed extends SyncState{
  @override
  final bool isAdmin;

  const SyncState_Failed({required this.isAdmin});
}

class SyncState_NoDb extends SyncState{
  @override
  final bool isAdmin = false;

  const SyncState_NoDb();
}

class SyncBloc extends Cubit<SyncState> {
  final AuthBloc _authBloc;
  final DataRepository dataRepository;
  final PrefsRepository prefsRepository;

  StreamSubscription? _syncSub;

  bool _isAdmin = false;

  SyncBloc({
    required AuthBloc authBloc,
    required this.dataRepository,
    required this.prefsRepository,
  })  : _authBloc = authBloc,
        super(SyncState_NotSynced(isAdmin: false)) {
    _syncSub = _authBloc.stream.listen((event) async {
      if (event.inProgress) {
        emit(SyncState_InProgress());
      } else if (event.isAuthenticated) {
        if(await _logIn(event.userId)){
          await _syncData();
        }
      } else {
        emit(SyncState_NotSynced(isAdmin: _isAdmin));
      }
    });
  }

  Future<void> _syncData() async {
    emit(SyncState_LoadingToCloud(isAdmin: _isAdmin));
    await dataRepository.loadToCloud();

    emit(SyncState_LoadingFlomCloud(isAdmin: _isAdmin));
    var syncDate = DateTime.now();
    if (await dataRepository.loadFromCloud(prefsRepository.syncDate)) {
      await prefsRepository.setSyncDate(syncDate);
      emit(SyncState_Synced(isAdmin: _isAdmin));
    } else {
      emit(SyncState_NotSynced(isAdmin: _isAdmin));
    }
  }

  Future<bool> _logIn(String userId) async {
    emit(SyncState_InProgress());
    if (await dataRepository.cloudDbExists(userId)) {
      await dataRepository.logIn(userId);
      _isAdmin = await dataRepository.isAdmin(userId);
      return true;
    } else {
      emit(SyncState_NoDb());
      return false;
    }
  }

  Future<void> createCloudDatabase() async {
    if (!_authBloc.state.inProgress && _authBloc.state.isAuthenticated) {
      emit(SyncState_InProgress());
      await dataRepository.createCloudDatabase(_authBloc.state.userId);
      await _syncData();
    }
  }

  void refreshConnection(){
    sync();
  }

  Future<void> sync() async {
    if (!_authBloc.state.inProgress && _authBloc.state.isAuthenticated) {
      await _syncData();
    }
  }

  void addUser(String newUserId){
    dataRepository.addNewUser(newUserId);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    return super.close();
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/data/prefs_repository.dart';

enum SyncState {
  IN_PROGRESS,
  LOADING_TO_CLOUD,
  LOADING_FROM_CLOUD,
  SYNCED,
  NOT_SYNCED,
  FAILED,
  NO_DB,
}

class SyncBloc extends Cubit<SyncState> {
  final AuthBloc _authBloc;
  final DataRepository dataRepository;
  final PrefsRepository prefsRepository;

  StreamSubscription? _syncSub;

  SyncBloc({
    required AuthBloc authBloc,
    required this.dataRepository,
    required this.prefsRepository,
  })  : _authBloc = authBloc,
        super(SyncState.NOT_SYNCED) {
    _syncSub = _authBloc.stream.listen((event) async {
      if (event.inProgress) {
        emit(SyncState.IN_PROGRESS);
      } else if (event.isAuthenticated) {
        if(await _logIn(event.userId)){
          await _syncData();
        }
      } else {
        emit(SyncState.NOT_SYNCED);
      }
    });
  }

  Future<void> _syncData() async {
    emit(SyncState.LOADING_TO_CLOUD);
    await dataRepository.loadToCloud();

    emit(SyncState.LOADING_FROM_CLOUD);
    var syncDate = DateTime.now();
    if (await dataRepository.loadFromCloud(prefsRepository.syncDate)) {
      await prefsRepository.setSyncDate(syncDate);
      emit(SyncState.SYNCED);
    } else {
      emit(SyncState.NOT_SYNCED);
    }
  }

  Future<bool> _logIn(String userId) async {
    emit(SyncState.IN_PROGRESS);
    if (await dataRepository.cloudDbExists(userId)) {
      await dataRepository.logIn(userId);
      return true;
    } else {
      emit(SyncState.NO_DB);
      return false;
    }
  }

  Future<void> createDatabase() async {
    if (!_authBloc.state.inProgress && _authBloc.state.isAuthenticated) {
      emit(SyncState.IN_PROGRESS);
      await dataRepository.createCloudDatabase(_authBloc.state.userId);
      await _syncData();
    }
  }

  Future<void> sync() async {
    if (!_authBloc.state.inProgress && _authBloc.state.isAuthenticated) {
      await _syncData();
    }
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    return super.close();
  }
}

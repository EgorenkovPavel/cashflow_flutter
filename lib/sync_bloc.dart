import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/data/prefs_repository.dart';

enum SyncState {
  IN_PROGRESS,
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
        await _syncData(event.userId);
      } else {
        emit(SyncState.NOT_SYNCED);
      }
    });
  }

  Future<void> _syncData(String userId) async {
    emit(SyncState.IN_PROGRESS);
    if (await dataRepository.cloudDbExists(userId)) {
      await dataRepository.logIn(userId);
      var syncDate = DateTime.now();
      if (await dataRepository.syncData(prefsRepository.syncDate)) {
        await prefsRepository.setSyncDate(syncDate);
        emit(SyncState.SYNCED);
      } else {
        emit(SyncState.NOT_SYNCED);
      }
    } else {
      emit(SyncState.NO_DB);
    }
  }

  Future<void> createDatabase() async {
    if (!_authBloc.state.inProgress && _authBloc.state.isAuthenticated) {
      emit(SyncState.IN_PROGRESS);
      await dataRepository.createCloudDatabase(_authBloc.state.userId);
      var syncDate = DateTime.now();
      await dataRepository.syncData(syncDate);
      await prefsRepository.setSyncDate(syncDate);
      emit(SyncState.SYNCED);
    }
  }

  Future<void> sync() async {
    if (!_authBloc.state.inProgress && _authBloc.state.isAuthenticated) {
      await _syncData(_authBloc.state.userId);
    }
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    return super.close();
  }
}

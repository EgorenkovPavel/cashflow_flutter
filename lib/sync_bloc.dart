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
}

class SyncBloc extends Cubit<SyncState> {
  final AuthBloc _authBloc;
  final DataRepository dataRepository;
  final PrefsRepository prefsRepository;

  StreamSubscription? sub;

  SyncBloc(
    this._authBloc,
    this.dataRepository,
    this.prefsRepository,
  ) : super(SyncState.NOT_SYNCED) {
    sub = _authBloc.stream.listen((event) async {
      if (event.inProgress) {
        emit(SyncState.IN_PROGRESS);
      } else if (event.isAuthenticated) {
        emit(SyncState.IN_PROGRESS);
        await dataRepository.logIn(event.userId);
        await dataRepository.syncData(prefsRepository.syncDate);
        await prefsRepository.setSyncDate(DateTime.now());
        emit(SyncState.SYNCED);
      } else {
        emit(SyncState.NOT_SYNCED);
      }
    });
  }

  Future<void> sync() async {
    if (!_authBloc.state.inProgress
    && _authBloc.state.isAuthenticated){
      emit(SyncState.IN_PROGRESS);
      await dataRepository.syncData(prefsRepository.syncDate);
      await prefsRepository.setSyncDate(DateTime.now());
      emit(SyncState.SYNCED);
    }
  }

  @override
  Future<void> close() {
    sub?.cancel();
    return super.close();
  }
}

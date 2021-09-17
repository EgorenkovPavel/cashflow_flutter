import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/drive_repository.dart';
import 'package:money_tracker/data/repository.dart';

class BackupPageState {
  final bool isAuthenticated;
  final bool inProgress;
  final BackupPageAction action;

  BackupPageState({
    required this.isAuthenticated,
    required this.action,
    required this.inProgress,
  });

  BackupPageState copyWith({
    BackupPageAction? action,
    bool? inProgress,
    bool? isAuthenticated,
  }) {
    return BackupPageState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      action: action ?? this.action,
      inProgress: inProgress ?? this.inProgress,
    );
  }
}

enum BackupPageAction {
  INITIAL,
  ERROR_GET_HTTP_CLIENT,
  SUCCESS_BACKUP,
  SUCCESS_RESTORE,
  SUCCESS_DELETE,
}

class SettingsPageBloc extends Cubit<BackupPageState> {
  final Repository _repository;
  final DriveRepository _driveRepository;
  final AuthBloc _authBloc;
  StreamSubscription? sub;

  SettingsPageBloc(
    this._repository,
    this._driveRepository,
      this._authBloc,
  ) : super(BackupPageState(
          isAuthenticated: _authBloc.state.isAuthenticated,
          action: BackupPageAction.INITIAL,
          inProgress: false,
        )) {
    sub = _authBloc.stream.listen((event) {
      emit(state.copyWith(
        inProgress: false,
        isAuthenticated: event.isAuthenticated,
        action: BackupPageAction.INITIAL,
      ));
    });
  }

  @override
  Future<void> close() {
    sub?.cancel();
    return super.close();
  }

  void signIn(){
    _authBloc.signIn();
  }

  void signOut(){
    _authBloc.signOut();
  }

  Future<void> backup(String catalogId, String fileName) async {
    emit(state.copyWith(
      action: BackupPageAction.INITIAL,
      inProgress: true,
    ));
    var data = await _repository.exportData();
    await _driveRepository.backup(data, catalogId, fileName);
    emit(state.copyWith(
      action: BackupPageAction.SUCCESS_BACKUP,
      inProgress: false,
    ));
  }

  Future<void> restore(String fileId) async {
    emit(state.copyWith(
      action: BackupPageAction.INITIAL,
      inProgress: true,
    ));
    var data = await _driveRepository.restore(fileId);
    if (data == null) {
      return null;
      // TODO add bad state emit
    }
    await _repository.importData(data);
    emit(state.copyWith(
      action: BackupPageAction.SUCCESS_RESTORE,
      inProgress: false,
    ));
  }

  Future<void> deleteAll() async {
    emit(state.copyWith(
      action: BackupPageAction.INITIAL,
      inProgress: true,
    ));
    await _repository.deleteAll();
    emit(state.copyWith(
      action: BackupPageAction.SUCCESS_DELETE,
      inProgress: false,
    ));
  }
}

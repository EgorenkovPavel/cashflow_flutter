import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/drive_repository.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/sync_bloc.dart';

class BackupPageState {
  final bool isAuthenticated;
  final bool inProgress;
  final bool isConnected;
  final String userId;
  final BackupPageAction action;
  final bool isAdmin;

  BackupPageState({
    required this.isConnected,
    required this.isAuthenticated,
    required this.action,
    required this.inProgress,
    this.userId = '',
    this.isAdmin = false,
  });

  BackupPageState copyWith({
    BackupPageAction? action,
    bool? isConnected,
    bool? inProgress,
    bool? isAuthenticated,
    String? userId,
    bool? isAdmin,
  }) {
    return BackupPageState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      action: action ?? this.action,
      isConnected: isConnected ?? this.isConnected,
      inProgress: inProgress ?? this.inProgress,
      userId: userId ?? this.userId,
      isAdmin: isAdmin ?? this.isAdmin,
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
  final DataRepository _repository;
  final DriveRepository _driveRepository;
  final AuthBloc _authBloc;
  final SyncBloc _syncBloc;

  StreamSubscription? subAuth;
  StreamSubscription? subSync;

  SettingsPageBloc(
    this._repository,
    this._driveRepository,
    this._authBloc,
    this._syncBloc,
  ) : super(BackupPageState(
          isAuthenticated: _authBloc.state.isAuthenticated,
          action: BackupPageAction.INITIAL,
          inProgress: false,
          isConnected: _syncBloc.state != SyncState.NO_DB,
          userId: _authBloc.state.userId,
        )) {
    _init();
  }

  Future<void> _init() async {
    subAuth = _authBloc.stream.listen((event) async {
      if (event.inProgress) {
        return;
      } else if (event.isAuthenticated) {
        _driveRepository.logIn(event.client!);
      } else if (!state.isAuthenticated) {
        _driveRepository.logOut();
      }

      var isAdmin = await _repository.isAdmin(event.userId);

      emit(state.copyWith(
        inProgress: false,
        isAuthenticated: event.isAuthenticated,
        action: BackupPageAction.INITIAL,
        userId: event.userId,
        isAdmin: isAdmin,
      ));
    });

    subSync = _syncBloc.stream.listen((event) async {
      emit(state.copyWith(
        isConnected: event != SyncState.NO_DB,
        isAdmin: await _repository.isAdmin(state.userId),
      ));
    });

    var isAdmin = await _repository.isAdmin(state.userId);
    emit(state.copyWith(isAdmin: isAdmin));

  }

  void refresh(){
    _syncBloc.sync();
  }

  void addUser(String newUser){
    _repository.addNewUser(newUser);
  }

  @override
  Future<void> close() {
    subAuth?.cancel();
    subSync?.cancel();
    return super.close();
  }

  void signIn() {
    _authBloc.signIn();
  }

  void signOut() {
    _authBloc.signOut();
  }

  void createCloudDatabase() async {
    await _syncBloc.createDatabase();
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

//TODO скрывать кнопку авторизации если нет интернета
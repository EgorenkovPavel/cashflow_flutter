import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';

class BackupPageState {
  final bool inProgress;
  final BackupPageAction action;

  BackupPageState({required this.action, required this.inProgress});

  BackupPageState copyWith(BackupPageAction? action, bool? inProgress) {
    return BackupPageState(
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

  SettingsPageBloc(this._repository)
      : super(BackupPageState(action: BackupPageAction.INITIAL, inProgress: false));

  Future<void> backup(String catalogId, String fileName) async {
    emit(BackupPageState(action: BackupPageAction.INITIAL, inProgress: true));
    await _repository.backup(catalogId, fileName);
    emit(BackupPageState(action: BackupPageAction.SUCCESS_BACKUP, inProgress: false));
  }

  Future<void> restore(String fileId) async {
    emit(BackupPageState(action: BackupPageAction.INITIAL, inProgress: true));
    await _repository.restore(fileId);
    emit(BackupPageState(action: BackupPageAction.SUCCESS_RESTORE, inProgress: false));
  }

  Future<void> deleteAll() async {
    emit(BackupPageState(action: BackupPageAction.INITIAL, inProgress: true));
    await _repository.deleteAll();
    emit(BackupPageState(action: BackupPageAction.SUCCESS_DELETE, inProgress: false));
  }
}

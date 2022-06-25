// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:money_tracker/data/sources/backup_source_impl.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/models.dart';

class DialogDriveState {
  final DialogDriveAction action;
  final List<DriveFile> folderList;
  final DriveFile? result;

  DialogDriveState({
    this.result,
    required this.action,
    required this.folderList,
  });

  DialogDriveState copyWith({
    required DialogDriveAction action,
    List<DriveFile>? folderList,
    DriveFile? result,
  }) {
    return DialogDriveState(
      action: action,
      folderList: folderList ?? this.folderList,
      result: result ?? this.result,
    );
  }
}

enum DialogDriveAction {
  NO_ACTION,
  JUMP_TO_START,
  RETURN_RESULT,
}

enum DialogMode {
  CHOOSE_FILE,
  CHOOSE_FOLDER,
}

class DriveDialogBloc extends Cubit<DialogDriveState> {
  final AuthRepository _authRepository;
  GoogleDrive? _repository;
  final DialogMode mode;

  final rootFolder = _Stack<DriveFile>();

  DriveDialogBloc({required AuthRepository repository, required this.mode})
      : _authRepository = repository,
        super(DialogDriveState(
          action: DialogDriveAction.NO_ACTION,
          folderList: [],
        )) {
    rootFolder.push(
      DriveFile.root(),
    );
  }

  Future<void> _init() async {
    final client = await _authRepository.getClient();
    if (client != null) {
      _repository = GoogleDrive(client);
    }
  }

  Future<void> loadFolders() async {
    if (_repository == null){
      await _init();
    }

    try {

      var files = await _repository?.getFiles(rootFolder.top().id);

      emit(
        DialogDriveState(
          action: DialogDriveAction.JUMP_TO_START,
          folderList: files ?? [],
        ),
      );
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(Exception('Error when load folders in drive dialog bloc'), stackTrace);
    }
  }

  void onFileTap(DriveFile file) {
    if (file.isFolder) {
      rootFolder.push(file);
      loadFolders();
    } else if (mode == DialogMode.CHOOSE_FILE) {
      emit(
        state.copyWith(
          action: DialogDriveAction.RETURN_RESULT,
          result: file,
        ),
      );
    }
  }

  void onBackPressed() {
    if (rootFolder.isEmpty()) {
      emit(
        state.copyWith(
          action: DialogDriveAction.RETURN_RESULT,
          result: null,
        ),
      );
    } else {
      rootFolder.pop();
      loadFolders();
    }
  }

  void choose() {
    if (mode == DialogMode.CHOOSE_FOLDER) {
      emit(
        state.copyWith(
          action: DialogDriveAction.RETURN_RESULT,
          result: rootFolder.top(),
        ),
      );
    }
  }
}

class _Stack<T> {
  List<T> list = [];

  void push(T item) {
    list.add(item);
  }

  T pop() {
    return list.removeLast();
  }

  T top() {
    return list.last;
  }

  bool isEmpty() {
    return list.isEmpty;
  }
}

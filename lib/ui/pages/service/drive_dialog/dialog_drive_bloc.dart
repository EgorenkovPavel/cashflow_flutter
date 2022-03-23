// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:money_tracker/data/sources/backup_source.dart';
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

class DialogDriveBloc extends Cubit<DialogDriveState> {
  final GoogleDrive _repository;
  final DialogMode mode;

  final rootFolder = _Stack<DriveFile>();

  DialogDriveBloc({required GoogleDrive repository, required this.mode})
      : _repository = repository,
        super(DialogDriveState(
          action: DialogDriveAction.NO_ACTION,
          folderList: [],
        )) {
    rootFolder.push(
      DriveFile.root(),
    );
  }

  Future<void> loadFolders() async {
    try {
      var files = await _repository.getFiles(rootFolder.top().id);

      emit(
        DialogDriveState(
          action: DialogDriveAction.JUMP_TO_START,
          folderList: files,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
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

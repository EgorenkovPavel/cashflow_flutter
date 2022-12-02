// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/data/sources/backup_source_impl.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'drive_dialog_bloc.freezed.dart';

@freezed
class DialogDriveEvent with _$DialogDriveEvent {
  const factory DialogDriveEvent.init() = _InitDialogDriveEvent;

  const factory DialogDriveEvent.loadFolders() = _LoadFoldersDialogDriveEvent;

  const factory DialogDriveEvent.onFileTap({required DriveFile file}) =
      _OnFileTapDialogDriveEvent;

  const factory DialogDriveEvent.backPressed() = _BackPressedDialogDriveEvent;

  const factory DialogDriveEvent.choose() = _ChooseDialogDriveEvent;
}

@freezed
class DialogDriveState with _$DialogDriveState {
  const factory DialogDriveState.success({
    DriveFile? result,
    required DialogDriveAction action,
    required List<DriveFile> folderList,
  }) = _SuccessDialogDriveState;

  const factory DialogDriveState.failure() = _FailureDialogDriveState;

  const factory DialogDriveState.inProgress() = _InProgressDialogDriveState;
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

class DriveDialogBloc extends Bloc<DialogDriveEvent, DialogDriveState> {
  final AuthRepository _authRepository;
  GoogleDrive? _repository;
  final DialogMode mode;

  final rootFolder = _Stack<DriveFile>();

  DriveDialogBloc({
    required AuthRepository repository,
    required this.mode,
  })  : _authRepository = repository,
        super(const DialogDriveState.success(
          action: DialogDriveAction.NO_ACTION,
          folderList: [],
        )) {
    on<DialogDriveEvent>(
      (event, emitter) => event.map(
        init: (event) => _init(event, emitter),
        loadFolders: (event) => _loadFolders(event, emitter),
        onFileTap: (event) => _onFileTap(event, emitter),
        backPressed: (event) => _backPressed(event, emitter),
        choose: (event) => _choose(event, emitter),
      ),
    );
    rootFolder.push(
      DriveFile.root(),
    );

    add(const DialogDriveEvent.init());
  }

  Future<void> _init(
    _InitDialogDriveEvent event,
    Emitter<DialogDriveState> emit,
  ) async {
    emit(const DialogDriveState.inProgress());
    final client = await _authRepository.getClient();
    if (client != null) {
      _repository = GoogleDrive(client);
    }
    emit(const DialogDriveState.success(
      action: DialogDriveAction.NO_ACTION,
      folderList: [],
    ));
  }

  Future<void> _loadFolders(
    DialogDriveEvent event,
    Emitter<DialogDriveState> emit,
  ) async {
    emit(const DialogDriveState.inProgress());
    try {
      final files = await _repository?.getFiles(rootFolder.top().id);

      emit(
        DialogDriveState.success(
          action: DialogDriveAction.JUMP_TO_START,
          folderList: files ?? [],
        ),
      );
    } catch (e) {
      emit(const DialogDriveState.failure());
    }
  }

  void _onFileTap(
    _OnFileTapDialogDriveEvent event,
    Emitter<DialogDriveState> emit,
  ) {
    if (event.file.isFolder) {
      rootFolder.push(event.file);
      _loadFolders(event, emit);
    } else if (mode == DialogMode.CHOOSE_FILE) {
      emit(
        DialogDriveState.success(
          action: DialogDriveAction.RETURN_RESULT,
          folderList: [],
          result: event.file,
        ),
      );
    }
  }

  void _backPressed(_BackPressedDialogDriveEvent event, Emitter<DialogDriveState> emit) {
    if (rootFolder.isEmpty()) {
      emit(
        const DialogDriveState.success(
          action: DialogDriveAction.RETURN_RESULT,
          folderList: [],
          result: null,
        ),
      );
    } else {
      rootFolder.pop();
      _loadFolders(event, emit);
    }
  }

  void _choose(_ChooseDialogDriveEvent event, Emitter<DialogDriveState> emit) {
    if (mode == DialogMode.CHOOSE_FOLDER) {
      emit(
        DialogDriveState.success(
          action: DialogDriveAction.RETURN_RESULT,
          folderList: [],
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

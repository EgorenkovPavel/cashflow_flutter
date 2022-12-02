// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/data/sources/backup_source_impl.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';

import '../../../../domain/interfaces/backup_repository.dart';

part 'google_drive_settings_bloc.freezed.dart';

@freezed
class DriveEvent with _$DriveEvent {
  const factory DriveEvent.backup({
    required String catalogId,
    required String fileName,
  }) = _BackupDriveEvent;

  const factory DriveEvent.restore({
    required String fileId,
  }) = _RestoreDriveEvent;
}

@freezed
class DriveState with _$DriveState {
  const DriveState._();

  const factory DriveState.initial() = _InitialDriveState;

  const factory DriveState.inProgress() = _InProgressDriveState;

  const factory DriveState.failure() = _FailureDriveState;

  const factory DriveState.successBackup() = _SuccessBackupDriveState;

  const factory DriveState.successRestore() = SuccessRestoreDriveState;

  bool get inProgress => maybeMap(
        inProgress: (_) => true,
        orElse: () => false,
      );
}

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  final BackupRepository _backupRepository;
  GoogleDrive? _driveRepository;

  //final AuthBloc _authBloc;
  final AuthRepository authRepository;

  StreamSubscription? _authSub;

  DriveBloc({
    required BackupRepository backupRepository,
    required AuthBloc authBloc,
    required this.authRepository,
  })  : _backupRepository = backupRepository,
        //_authBloc = authBloc,
        super(const DriveState.initial()) {
    on<DriveEvent>(
      (event, emitter) => event.map(
        backup: (event) => _backup(event, emitter),
        restore: (event) => _restore(event, emitter),
      ),
    );

    _authState(authBloc.state);
    _authSub = authBloc.stream.listen((event) {
      _authState(event);
    });
  }

  Future<void> _authState(AuthState event) async {
    if (event.isAuthenticated) {
      final client = await authRepository.getClient();
      _driveRepository = client != null ? GoogleDrive(client) : null;
    } else {
      _driveRepository = null;
    }
  }

  Future<void> _backup(
    _BackupDriveEvent event,
    Emitter<DriveState> emit,
  ) async {
    if (_driveRepository == null) {
      return;
    }
    emit(const DriveState.inProgress());
    try {
      var data = await _backupRepository.exportData();
      await _driveRepository!.backup(data, event.catalogId, event.fileName);
      emit(const DriveState.successBackup());
    } catch (e) {
      emit(const DriveState.failure());
    }
  }

  Future<void> _restore(
    _RestoreDriveEvent event,
    Emitter<DriveState> emit,
  ) async {
    if (_driveRepository == null) {
      return;
    }
    emit(const DriveState.inProgress());
    try {
      var data = await _driveRepository!.restore(event.fileId);
      if (data == null) {
        emit(const DriveState.failure());
      } else {
        await _backupRepository.importData(data);
        emit(const DriveState.successRestore());
      }
    } catch (e) {
      emit(const DriveState.failure());
    }
  }

  @override
  Future<void> close() async {
    await _authSub?.cancel();

    return super.close();
  }
}

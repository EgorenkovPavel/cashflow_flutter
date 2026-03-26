// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/interfaces/backup_repository.dart';

part 'data_control_bloc.freezed.dart';

@freezed
class DataControlEvent with _$DataControlEvent {
  const factory DataControlEvent.deleteAll() = _DeleteAllDataControlEvent;
}

@freezed
class DataControlState with _$DataControlState {
  const DataControlState._();

  const factory DataControlState.initial() = _InitialDataControlState;

  const factory DataControlState.inProgress() = _InProgressDataControlState;

  const factory DataControlState.success() = _SuccessDataControlState;
}

class DataControlBloc extends Bloc<DataControlEvent, DataControlState> {
  final BackupRepository _backupRepository;

  DataControlBloc(this._backupRepository)
      : super(const DataControlState.initial()) {
    on<DataControlEvent>((event, emitter) => event.map(
          deleteAll: (event) => _deleteAll(event, emitter),
        ));
  }

  FutureOr<void> _deleteAll(
    _DeleteAllDataControlEvent event,
    Emitter<DataControlState> emit,
  ) async {
    emit(const DataControlState.inProgress());
    await _backupRepository.deleteAll();
    emit(const DataControlState.success());
  }
}

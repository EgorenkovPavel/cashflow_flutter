// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';

import '../../../../domain/interfaces/backup_repository.dart';

enum DataControlState{
  INITIAL,
  IN_PROGRESS,
  SUCCESS,
}

class DataControlBloc extends Cubit<DataControlState>{

  final BackupRepository _backupRepository;

  DataControlBloc(this._backupRepository) : super(DataControlState.INITIAL);

  Future<void> deleteAll() async {
    emit(DataControlState.IN_PROGRESS);
    await _backupRepository.deleteAll();
    emit(DataControlState.SUCCESS);
  }

}
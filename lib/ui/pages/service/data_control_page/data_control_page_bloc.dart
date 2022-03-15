// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:money_tracker/domain/interfaces/data_source.dart';

enum DataControlState{
  INITIAL,
  IN_PROGRESS,
  SUCCESS
}

class DataControlBloc extends Cubit<DataControlState>{

  final DataSource _dataRepository;

  DataControlBloc(this._dataRepository) : super(DataControlState.INITIAL);

  Future<void> deleteAll() async {
    emit(DataControlState.IN_PROGRESS);
    await _dataRepository.deleteAll();
    emit(DataControlState.SUCCESS);
  }

}
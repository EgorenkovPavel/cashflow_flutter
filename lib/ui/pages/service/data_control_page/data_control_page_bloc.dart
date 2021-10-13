import 'package:bloc/bloc.dart';
import 'package:money_tracker/data/data_repository.dart';

enum DataControlState{
  INITIAL,
  IN_PROGRESS,
  SUCCESS
}

class DataControlBloc extends Cubit<DataControlState>{

  final DataRepository _dataRepository;

  DataControlBloc(this._dataRepository) : super(DataControlState.INITIAL);

  Future<void> deleteAll() async {
    emit(DataControlState.IN_PROGRESS);
    await _dataRepository.deleteAll();
    emit(DataControlState.SUCCESS);
  }

}
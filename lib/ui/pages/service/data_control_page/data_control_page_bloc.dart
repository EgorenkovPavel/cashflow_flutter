import 'package:bloc/bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';

enum DataControlState{
  INITIAL,
  IN_PROGRESS,
  SUCCESS
}

class DataControlBloc extends Cubit<DataControlState>{

  final LocalSource _dataRepository;

  DataControlBloc(this._dataRepository) : super(DataControlState.INITIAL);

  Future<void> deleteAll() async {
    emit(DataControlState.IN_PROGRESS);
    await _dataRepository.deleteAll();
    emit(DataControlState.SUCCESS);
  }

}
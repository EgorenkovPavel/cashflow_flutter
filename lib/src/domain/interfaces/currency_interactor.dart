import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

class CurrencyInteractor{
  final DataRepository _dataRepository;

  CurrencyInteractor(this._dataRepository);

  Future<double> usdRate() => _dataRepository.usdRate();
  Future<double> eurRate() =>  _dataRepository.eurRate();
}
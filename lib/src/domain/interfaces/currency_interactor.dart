import 'package:money_tracker/src/domain/interfaces/currency_repository.dart';

class CurrencyInteractor {
  final CurrencyRepository _currencyRepository;

  CurrencyInteractor(this._currencyRepository);

  Future<double> usdRate() => _currencyRepository.usdRate();

  Future<double> eurRate() => _currencyRepository.eurRate();
}
import '../interfaces/currency_repository.dart';
import '../models.dart';

class CurrencyInteractor {

  final Currency _baseCurrency = Currency.RUB;

  final CurrencyRepository _currencyRepository;

  CurrencyInteractor(this._currencyRepository);

  Currency get baseCurrency => _baseCurrency;

  Future<double> usdRate() => _currencyRepository.usdRate();

  Future<double> eurRate() => _currencyRepository.eurRate();
}
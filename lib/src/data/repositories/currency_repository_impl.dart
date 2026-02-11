import '../../domain/interfaces/currency_repository.dart';
import '../sources/currency_rate_source.dart';

/// Implementation of [CurrencyRepository] using [CurrencyRateSource].
class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRateSource _currencyRateSource;

  CurrencyRepositoryImpl(this._currencyRateSource);

  @override
  Future<double> eurRate() => _currencyRateSource.getEUR();

  @override
  Future<double> usdRate() => _currencyRateSource.getUSD();
}

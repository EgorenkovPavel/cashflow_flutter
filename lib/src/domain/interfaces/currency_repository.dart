/// Repository for managing currency exchange rates.
abstract class CurrencyRepository {
  /// Get USD exchange rate.
  Future<double> usdRate();

  /// Get EUR exchange rate.
  Future<double> eurRate();
}


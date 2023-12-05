

enum Currency {
  RUB('₽'),
  USD('\$'),
  EUR('€');

  final String symbol;

  const Currency(this.symbol);
}
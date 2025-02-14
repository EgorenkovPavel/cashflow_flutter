

enum Currency {
  RUB('₽'),
  USD('\$'),
  EUR('€');

  final String symbol;

  const Currency(this.symbol);

  static Currency byName(String name) => switch(name) {
    'RUB' => RUB,
    'EUR' => EUR,
    'USD' => USD,
    String() => RUB,
  };

  @override
  String toString() => switch(this){
    Currency.RUB => 'RUB',
    Currency.EUR => 'EUR',
    Currency.USD => 'USD',
  };
}
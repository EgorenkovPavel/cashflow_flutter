enum Currency{
  RUB, EUR, USD;

  static Currency byName(String name) => switch(name) {
    'RUB' => RUB,
    'EUR' => EUR,
    'USD' => USD,
    String() => throw UnsupportedError('Not found currency'),
  };

  @override
  String toString() => switch(this){
    Currency.RUB => 'RUB',
    Currency.EUR => 'EUR',
    Currency.USD => 'USD',
  };
}
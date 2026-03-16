import 'package:drift/drift.dart';

import '../../../../domain/models/enum/currency.dart';

class CurrencyConverter extends TypeConverter<Currency, String> {
  const CurrencyConverter();

  @override
  Currency fromSql(String fromDb) => switch (fromDb) {
    'RUB' => Currency.RUB,
    'USD' => Currency.USD,
    'EUR' => Currency.EUR,
    _ => Currency.RUB,
  };

  @override
  String toSql(Currency value) => switch (value) {
    Currency.RUB => 'RUB',
    Currency.EUR => 'EUR',
    Currency.USD => 'USD',
  };
}

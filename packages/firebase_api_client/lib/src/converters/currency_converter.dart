
import 'package:finance_models/finance_models.dart';
import 'package:firebase_api_client/src/converters/type_converter.dart';

class CurrencyConverter extends TypeConverter<Currency, String> {
  const CurrencyConverter();

  @override
  Currency fromCloud(String fromDb) => switch (fromDb) {
    'RUB' => Currency.RUB,
    'USD' => Currency.USD,
    'EUR' => Currency.EUR,
    _ => Currency.RUB,
  };

  @override
  String toCloud(Currency value) => switch (value) {
    Currency.RUB => 'RUB',
    Currency.EUR => 'EUR',
    Currency.USD => 'USD',
  };
}

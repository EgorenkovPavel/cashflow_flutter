import 'package:drift/drift.dart';

import '../../../../domain/models/enum/currency.dart';

class CurrencyConverter extends TypeConverter<Currency, String>{
  const CurrencyConverter();

  @override
  Currency fromSql(String fromDb) {
    switch (fromDb){
      case 'RUB': return Currency.RUB;
      case 'USD': return Currency.USD;
      case 'EUR': return Currency.EUR;
        default: return Currency.RUB;
    }
  }

  @override
  String toSql(Currency value) {
    switch (value){
      case Currency.RUB: return 'RUB';
      case Currency.EUR: return 'EUR';
      case Currency.USD: return 'USD';
    }
  }
}
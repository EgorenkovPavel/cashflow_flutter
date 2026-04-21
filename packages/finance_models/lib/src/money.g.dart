// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Money _$MoneyFromJson(Map<String, dynamic> json) => _Money(
  (json['sum'] as num).toInt(),
  $enumDecode(_$CurrencyEnumMap, json['currency']),
);

Map<String, dynamic> _$MoneyToJson(_Money instance) => <String, dynamic>{
  'sum': instance.sum,
  'currency': _$CurrencyEnumMap[instance.currency]!,
};

const _$CurrencyEnumMap = {
  Currency.RUB: 'RUB',
  Currency.USD: 'USD',
  Currency.EUR: 'EUR',
};

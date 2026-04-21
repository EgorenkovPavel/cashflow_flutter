import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum/currency.dart';

part 'money.freezed.dart';
part 'money.g.dart';

@freezed
abstract class Money with _$Money{
  const Money._();
  const factory Money(int sum, Currency currency) = _Money;

  Money operator +(int sum) => Money(this.sum + sum, currency);

  Money operator *(int sum) => Money(this.sum * sum, currency);

  Money operator /(int sum) => Money((this.sum / sum).floor(), currency);

  bool get isEmpty => sum == 0;

  factory Money.fromJson(Map<String, Object?> json) => _$MoneyFromJson(json);
}




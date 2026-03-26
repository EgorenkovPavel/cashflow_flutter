import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum/currency.dart';

part 'sum.freezed.dart';

@freezed
abstract class Sum with _$Sum{
  const Sum._();
  const factory Sum(int sum, Currency currency) = _Sum;

  Sum operator +(int sum) => Sum(this.sum + sum, currency);

  Sum operator *(int sum) => Sum(this.sum * sum, currency);

  Sum operator /(int sum) => Sum((this.sum / sum).floor(), currency);

  bool get isEmpty => sum == 0;
}




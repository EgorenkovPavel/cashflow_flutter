
import 'package:freezed_annotation/freezed_annotation.dart';
import 'category.dart';

part 'category_month_cashflow.freezed.dart';

@freezed
class CategoryMonthCashflow with _$CategoryMonthCashflow {
  const factory CategoryMonthCashflow({
    required Category category,
    required int month,
    required int cashflow,
  }) = _CategoryMonthCashflow;
}

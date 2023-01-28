import 'package:freezed_annotation/freezed_annotation.dart';
import '../category/category.dart';

part 'category_cashflow.freezed.dart';

@freezed
class CategoryCashflow with _$CategoryCashflow {
  const factory CategoryCashflow({
    required Category category,
    required int monthCashflow,
    required int yearCashflow,
  }) = _CategoryCashflow;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/data/sources/local/data/database.dart';

part 'category_month_cashflow_entity.freezed.dart';

@freezed
class CategoryMonthCashflowEntity with _$CategoryMonthCashflowEntity {
  const factory CategoryMonthCashflowEntity({
    required CategoryDB category,
    required int month,
    required int cashflow,
  }) = _CategoryMonthCashflowEntity;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/database.dart';

part 'category_cashflow_entity.freezed.dart';

@freezed
class CategoryCashflowEntity with _$CategoryCashflowEntity {
  const factory CategoryCashflowEntity({
    required CategoryDB category,
    required int monthCashflow,
    required int yearCashflow,
  }) = _CategoryCashflowEntity;
}

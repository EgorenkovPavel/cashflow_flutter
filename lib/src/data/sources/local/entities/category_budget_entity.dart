import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/database.dart';

part 'category_budget_entity.freezed.dart';

@freezed
class CategoryBudgetEntity with _$CategoryBudgetEntity {
  const factory CategoryBudgetEntity({
    required CategoryDB category,
    required int budget,
  }) = _CategoryBudgetEntity;
}

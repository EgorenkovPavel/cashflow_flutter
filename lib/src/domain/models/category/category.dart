import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/budget_type.dart';
import '../enum/currency.dart';
import '../enum/operation_type.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    @Default(0) int id,
    @Default('') String cloudId,
    required String title,
    required OperationType operationType,
    required BudgetType budgetType,
    required int budget,
    required Currency currency,
  }) = _Category;
}

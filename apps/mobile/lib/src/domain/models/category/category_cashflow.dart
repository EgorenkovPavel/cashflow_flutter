import 'package:freezed_annotation/freezed_annotation.dart';

import '../balance.dart';
import '../enum/budget_type.dart';
import '../enum/category_type.dart';

part 'category_cashflow.freezed.dart';

@freezed
abstract class CategoryCashFlow with _$CategoryCashFlow {
  const CategoryCashFlow._();

  const factory CategoryCashFlow({
    required int categoryId,
    required CategoryType type,
    required String categoryTitle,
    required BudgetType budgetType,
    required int budget,
    required Balance monthCashFlow,
    required Balance yearCashFlow,
    required int? parentId,
  }) = _CategoryCashFlow;

  int budgetByType(BudgetType type) => switch (type) {
    BudgetType.MONTH => monthBudget,
    BudgetType.YEAR => yearBudget,
  };

  Balance cashflowByType(BudgetType type) => switch (type) {
    BudgetType.MONTH => monthCashFlow,
    BudgetType.YEAR => yearCashFlow,
  };

  int get monthBudget => switch (budgetType) {
    BudgetType.MONTH => budget,
    BudgetType.YEAR => (budget / 12).toInt(),
  };

  int get yearBudget => switch (budgetType) {
    BudgetType.MONTH => budget * 12,
    BudgetType.YEAR => budget,
  };
}

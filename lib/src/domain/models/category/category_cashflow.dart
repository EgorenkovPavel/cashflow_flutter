import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/utils/balance.dart';

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
  }) = _CategoryCashFlow;

  int get monthBudget => switch (budgetType) {
    BudgetType.MONTH => budget,
    BudgetType.YEAR => (budget / 12).toInt(),
  };

  int get yearBudget => switch (budgetType) {
    BudgetType.MONTH => budget * 12,
    BudgetType.YEAR => budget,
  };
}

import 'package:equatable/equatable.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/utils/balance.dart';

sealed class CategoryCashFlow extends Equatable {
  final int categoryId;
  final String categoryTitle;
  final BudgetType budgetType;
  final int budget;
  final Balance monthCashFlow;
  final Balance yearCashFlow;

  const CategoryCashFlow(
      {required this.categoryId,
      required this.categoryTitle,
      required this.budgetType,
      required this.budget,
      required this.monthCashFlow,
      required this.yearCashFlow});

  int get monthBudget => switch (budgetType) {
        BudgetType.MONTH => budget,
        BudgetType.YEAR => (budget / 12).toInt(),
      };

  int get yearBudget => switch (budgetType) {
        BudgetType.MONTH => budget * 12,
        BudgetType.YEAR => budget,
      };

  @override
  List<Object?> get props => [
        categoryId,
        categoryTitle,
        budgetType,
        budget,
        monthCashFlow,
        yearCashFlow
      ];

  CategoryCashFlow copyWith({
    int? categoryId,
    String? categoryTitle,
    BudgetType? budgetType,
    int? budget,
    Balance? monthCashFlow,
    Balance? yearCashFlow,
  });
}

class InputCategoryCashFlow extends CategoryCashFlow {
  const InputCategoryCashFlow(
      {required super.categoryId,
      required super.categoryTitle,
      required super.budgetType,
      required super.budget,
      required super.monthCashFlow,
      required super.yearCashFlow});

  @override
  InputCategoryCashFlow copyWith({
    int? categoryId,
    String? categoryTitle,
    BudgetType? budgetType,
    int? budget,
    Balance? monthCashFlow,
    Balance? yearCashFlow,
  }) =>
      InputCategoryCashFlow(
        categoryId: categoryId ?? this.categoryId,
        categoryTitle: categoryTitle ?? this.categoryTitle,
        budgetType: budgetType ?? this.budgetType,
        budget: budget ?? this.budget,
        monthCashFlow: monthCashFlow ?? this.monthCashFlow,
        yearCashFlow: yearCashFlow ?? this.yearCashFlow,
      );
}

class OutputCategoryCashFlow extends CategoryCashFlow {
  const OutputCategoryCashFlow(
      {required super.categoryId,
      required super.categoryTitle,
      required super.budgetType,
      required super.budget,
      required super.monthCashFlow,
      required super.yearCashFlow});

  @override
  OutputCategoryCashFlow copyWith({
    int? categoryId,
    String? categoryTitle,
    BudgetType? budgetType,
    int? budget,
    Balance? monthCashFlow,
    Balance? yearCashFlow,
  }) =>
      OutputCategoryCashFlow(
        categoryId: categoryId ?? this.categoryId,
        categoryTitle: categoryTitle ?? this.categoryTitle,
        budgetType: budgetType ?? this.budgetType,
        budget: budget ?? this.budget,
        monthCashFlow: monthCashFlow ?? this.monthCashFlow,
        yearCashFlow: yearCashFlow ?? this.yearCashFlow,
      );
}

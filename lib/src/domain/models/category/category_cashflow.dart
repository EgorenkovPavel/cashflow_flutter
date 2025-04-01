import 'package:equatable/equatable.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/utils/sum.dart';

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

  @override
  List<Object?> get props => [
        categoryId,
        categoryTitle,
        budgetType,
        budget,
        monthCashFlow,
        yearCashFlow
      ];
}

class InputCategoryCashFlow extends CategoryCashFlow {
  const InputCategoryCashFlow(
      {required super.categoryId,
      required super.categoryTitle,
      required super.budgetType,
      required super.budget,
      required super.monthCashFlow,
      required super.yearCashFlow});
}

class OutputCategoryCashFlow extends CategoryCashFlow {
  const OutputCategoryCashFlow(
      {required super.categoryId,
      required super.categoryTitle,
      required super.budgetType,
      required super.budget,
      required super.monthCashFlow,
      required super.yearCashFlow});
}

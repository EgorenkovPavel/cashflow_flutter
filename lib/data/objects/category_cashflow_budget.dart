import 'package:cashflow/data/operation_type.dart';

class CategoryCashflowBudget {
  final int id;
  final String title;
  final bool archive;
  final OperationType type;

  final int year;
  final int month;
  final int budget;
  final int cashflow;

  const CategoryCashflowBudget(
      {this.id,
      this.title,
      this.archive,
      this.type,
      this.year,
      this.month,
      this.budget,
      this.cashflow});

}

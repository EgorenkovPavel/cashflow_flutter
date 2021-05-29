import 'package:cashflow/data/objects/operation_type.dart';

class CategoryCashflowBudget {
  final int id;
  final String title;
  final OperationType type;

  final int year;
  final int month;
  final int budget;
  final int cashflow;

  const CategoryCashflowBudget(
      {required this.id,
      required this.title,
      required this.type,
      required this.year,
      required this.month,
      required this.budget,
      required this.cashflow});

}

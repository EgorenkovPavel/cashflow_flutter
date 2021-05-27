import 'package:cashflow/data/objects/budget_type.dart';
import 'package:cashflow/data/objects/category.dart';

class Budget{
  final BudgetType type;
  final Category category;
  final DateTime date;
  final int sum;

  Budget({this.type, this.category, this.date, this.sum});
}
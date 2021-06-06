
import 'budget_type.dart';
import 'category.dart';

class Budget {
  final BudgetType type;
  final Category category;
  final int month;
  final int year;
  final int sum;

  Budget(
      {required this.type,
      required this.category,
      required this.month,
      required this.year,
      required this.sum});
}

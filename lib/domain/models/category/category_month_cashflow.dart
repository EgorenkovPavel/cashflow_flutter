import 'package:money_tracker/domain/models/category/category.dart';

class CategoryMonthCashflow {
  final Category category;
  final int month;
  final int cashflow;

  CategoryMonthCashflow({
    required this.category,
    required this.month,
    required this.cashflow,
  });
}

import 'package:money_tracker/domain/models/category/category.dart';

class CategoryCashflow {
  final Category category;
  final int monthCashflow;
  final int yearCashflow;

  const CategoryCashflow({
    required this.category,
    required this.monthCashflow,
    required this.yearCashflow,
  });
}

import 'package:money_tracker/domain/models/category.dart';

class CategoryCashflow {
  final Category category;
  final int cashflow;

  const CategoryCashflow(
      {required this.category,
      required this.cashflow});
}

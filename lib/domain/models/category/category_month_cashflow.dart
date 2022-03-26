import 'package:equatable/equatable.dart';
import 'package:money_tracker/domain/models/category/category.dart';

class CategoryMonthCashflow extends Equatable{
  final Category category;
  final int month;
  final int cashflow;

  const CategoryMonthCashflow({
    required this.category,
    required this.month,
    required this.cashflow,
  });

  @override
  List<Object?> get props => [category, month, cashflow];
}

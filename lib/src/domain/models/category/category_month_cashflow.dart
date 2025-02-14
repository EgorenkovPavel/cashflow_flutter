import 'package:equatable/equatable.dart';

import 'category.dart';

class CategoryMonthCashflow extends Equatable {
  final CategoryItem category;
  final int month;
  final int cashflow;

  const CategoryMonthCashflow({
    required this.category,
    required this.month,
    required this.cashflow,
  });

  @override
  List<Object?> get props => [category,month,cashflow];
}

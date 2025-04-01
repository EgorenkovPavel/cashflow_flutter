import 'package:equatable/equatable.dart';
import 'package:money_tracker/src/utils/sum.dart';

class CategoryMonthCashFlow extends Equatable {
  final int categoryId;
  final int month;
  final Balance cashFlow;

  const CategoryMonthCashFlow({
    required this.categoryId,
    required this.month,
    required this.cashFlow,
  });

  @override
  List<Object?> get props => [categoryId,month,cashFlow];
}

import 'package:equatable/equatable.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';

class CategoryMonthCashflowEntity extends Equatable{
  final CategoryDB category;
  final int month;
  final int cashflow;

  const CategoryMonthCashflowEntity({
    required this.month,
    required this.category,
    required this.cashflow,
  });

  @override
  List<Object?> get props => [category,month,cashflow];
}
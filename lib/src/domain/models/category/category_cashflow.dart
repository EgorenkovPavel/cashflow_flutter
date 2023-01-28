import 'package:equatable/equatable.dart';
import '../category/category.dart';

class CategoryCashflow extends Equatable{
  final Category category;
  final int monthCashflow;
  final int yearCashflow;

  const CategoryCashflow({
    required this.category,
    required this.monthCashflow,
    required this.yearCashflow,
  });

  @override
  List<Object?> get props => [category, monthCashflow, yearCashflow];
}

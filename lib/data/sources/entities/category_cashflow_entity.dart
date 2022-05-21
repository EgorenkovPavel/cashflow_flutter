import 'package:equatable/equatable.dart';

import '../local/data/database.dart';

class CategoryCashflowEntity extends Equatable{
  final CategoryDB category;
  final int monthCashflow;
  final int yearCashflow;

  const CategoryCashflowEntity({
    required this.category,
    required this.monthCashflow,
    required this.yearCashflow,
  });

  @override
  List<Object?> get props => [category,monthCashflow,yearCashflow];
}
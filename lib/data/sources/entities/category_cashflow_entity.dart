import 'package:equatable/equatable.dart';

import '../local/data/database.dart';

class CategoryCashflowEntity extends Equatable{
  CategoryDB category;
  int monthCashflow;
  int yearCashflow;

  CategoryCashflowEntity({
    required this.category,
    required this.monthCashflow,
    required this.yearCashflow,
  });

  @override
  List<Object?> get props => [category,monthCashflow,yearCashflow];
}
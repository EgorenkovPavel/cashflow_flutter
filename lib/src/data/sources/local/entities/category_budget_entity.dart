import 'package:equatable/equatable.dart';

import '../data/database.dart';

class CategoryBudgetEntity extends Equatable{
  final CategoryDB category;
  final int budget;

  const CategoryBudgetEntity(this.category, this.budget);

  @override
  List<Object?> get props => [category, budget];
}
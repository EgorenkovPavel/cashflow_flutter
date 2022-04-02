import 'package:equatable/equatable.dart';

import '../local/data/database.dart';

class CategoryBudgetEntity extends Equatable{
  CategoryDB category;
  int budget;

  CategoryBudgetEntity(this.category, this.budget);

  @override
  List<Object?> get props => [category, budget];
}
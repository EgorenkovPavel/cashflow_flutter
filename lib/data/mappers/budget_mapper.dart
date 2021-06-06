
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/domain/models.dart';

import 'category_mapper.dart';
import 'mapper.dart';

class BudgetMapper extends Mapper<Budget, BudgetItem> {

  const BudgetMapper();

  @override
  Budget mapToDart(BudgetItem c) {
    return Budget(
        month: c.month,
        year: c.year,
        type: c.budgetType,
        category: const CategoryMapper().mapToDart(c.category),
        sum: c.sum);
  }

  @override
  BudgetItem mapToSql(Budget c) {
    return BudgetItem(
        year: c.year,
        month: c.month,
        category: const CategoryMapper().mapToSql(c.category),
        budgetType: c.type,
        sum: c.sum);
  }
}

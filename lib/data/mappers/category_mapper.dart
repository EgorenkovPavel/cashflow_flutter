import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/domain/models.dart';

import 'mapper.dart';

class CategoryMapper extends Mapper<Category, CategoryDB> {
  const CategoryMapper();

  @override
  CategoryDB mapToSql(Category c) {
    return CategoryDB(
      id: c.id,
      title: c.title,
      operationType: c.operationType,
      budgetType: c.budgetType,
      budget: c.budget,
    );
  }

  @override
  Category mapToDart(CategoryDB c) {
    return Category(
      id: c.id,
      title: c.title,
      operationType: c.operationType,
      budgetType: c.budgetType,
      budget: c.budget,
    );
  }
}

import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:money_tracker/src/domain/models.dart';

import 'mapper.dart';

class CategoryMapper extends Mapper<Category, CategoryDB> {
  const CategoryMapper();

  @override
  CategoryDB mapToSql(Category c) {
    return CategoryDB(
      id: c.id,
      cloudId: c.cloudId,
      title: c.title,
      operationType: c.operationType,
      budgetType: c.budgetType,
      budget: c.budget,
      currency: c.currency,
      synced: false,
    );
  }

  @override
  Category mapToDart(CategoryDB c) {
    return Category(
      id: c.id,
      cloudId: c.cloudId,
      title: c.title,
      operationType: c.operationType,
      budgetType: c.budgetType,
      budget: c.budget,
      currency: c.currency,
    );
  }
}


import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/domain/models/category.dart';

import 'mapper.dart';

class CategoryMapper extends Mapper<Category, CategoryDB>{
  const CategoryMapper();

  @override
  CategoryDB mapToSql(Category c){
    return CategoryDB(id: c.id, title: c.title, operationType: c.type);
  }

  @override
  Category mapToDart(CategoryDB c){
    return Category(id: c.id, title: c.title, type: c.operationType);
  }

  MapEntry<Category, int> mapCategoryBudgetToDart(CategoryBudgetEntity c){
    return MapEntry(mapToDart(c.category), c.budget);
  }
}
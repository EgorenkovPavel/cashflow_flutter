import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/category.dart';

class CategoryMapper extends Mapper<Category, CategoryEntityData>{
  const CategoryMapper();

  CategoryEntityData mapToSql(Category c){
    return CategoryEntityData(id: c.id, title: c.title, archive: c.archive, operationType: c.type);
  }

  Category mapToDart(CategoryEntityData c){
    return Category(id: c.id, title: c.title, archive: c.archive, type: c.operationType);
  }

  MapEntry<Category, int> mapCategoryBudgetToDart(CategoryBudgetEntity c){
    return MapEntry(mapToDart(c.category), c.budget);
  }
}
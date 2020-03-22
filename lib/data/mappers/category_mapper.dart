import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/category.dart';

class CategoryMapper extends Mapper<Category, CategoryData>{
  const CategoryMapper();

  CategoryData mapToSql(Category c){
    return CategoryData(id: c.id, title: c.title, archive: c.archive, operationType: c.type);
  }

  Category mapToDart(CategoryData c){
    return Category(id: c.id, title: c.title, archive: c.archive, type: c.operationType);
  }
}
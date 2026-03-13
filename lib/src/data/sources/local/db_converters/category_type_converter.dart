
import 'package:money_tracker/src/domain/models.dart';
import 'package:drift/drift.dart';

class CategoryTypeConverter extends TypeConverter<CategoryType, int> {
  const CategoryTypeConverter();

  @override
  CategoryType fromSql(int fromDb) {

    switch (fromDb) {
      case 1:
        return CategoryType.INPUT;
      case 2:
        return CategoryType.OUTPUT;
      default:
        throw Exception('No such type');
    }
  }

  @override
  int toSql(CategoryType value) {
    switch (value) {
      case CategoryType.INPUT:
        return 1;
      case CategoryType.OUTPUT:
        return 2;
    }
  }
}

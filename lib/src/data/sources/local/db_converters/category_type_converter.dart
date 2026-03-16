import 'package:money_tracker/src/domain/models.dart';
import 'package:drift/drift.dart';

class CategoryTypeConverter extends TypeConverter<CategoryType, int> {
  const CategoryTypeConverter();

  @override
  CategoryType fromSql(int fromDb) => switch (fromDb) {
    1 => CategoryType.INPUT,
    2 => CategoryType.OUTPUT,
    _ => throw Exception('No such type'),
  };

  @override
  int toSql(CategoryType value) => switch (value) {
    CategoryType.INPUT => 1,
    CategoryType.OUTPUT => 2,
  };
}

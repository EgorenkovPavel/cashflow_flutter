
import 'package:finance_models/finance_models.dart';
import 'package:firebase_api_client/src/converters/type_converter.dart';

class CategoryTypeConverter extends TypeConverter<CategoryType, int> {
  const CategoryTypeConverter();

  @override
  CategoryType fromCloud(int fromDb) => switch (fromDb) {
    1 => CategoryType.INPUT,
    2 => CategoryType.OUTPUT,
    _ => throw Exception('No such type'),
  };

  @override
  int toCloud(CategoryType value) => switch (value) {
    CategoryType.INPUT => 1,
    CategoryType.OUTPUT => 2,
  };
}

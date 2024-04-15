import 'package:cloud_db/src/extensions.dart';

import '../models/category.dart';
import 'cloud_converter.dart';

class CategoryMapper extends CloudConverter<Category> {
  static const String _KEY_TITLE = 'title';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_BUDGET_TYPE = 'budget_type';
  static const String _KEY_BUDGET = 'budget';
  static const String _KEY_CURRENCY = 'currency';
  static const String _KEY_UPDATED = 'updated';
  static const String _KEY_DELETION_MARK = 'deleted';

  const CategoryMapper();

  @override
  Map<String, dynamic> mapToCloud(Category category) {
    return {
      _KEY_TITLE: category.title,
      _KEY_OPERATION_TYPE: category.operationType,
      _KEY_BUDGET_TYPE: category.budgetType,
      _KEY_BUDGET: category.budget,
      _KEY_CURRENCY: category.currency,
      _KEY_UPDATED: DateTime.now(),
      _KEY_DELETION_MARK: category.deleted,
    };
  }

  @override
  Category mapToDart(String id, Map<String, dynamic> data) =>
    Category(
      id: id,
      budgetType: data.getOrDefault(_KEY_BUDGET_TYPE, 1),
      budget: data.getOrDefault(_KEY_BUDGET, 0),
      currency: data.getOrDefault(_KEY_CURRENCY, 'RUB'),
      title: data.getOrDefault(_KEY_TITLE, ''),
      operationType: data.getOrDefault(_KEY_OPERATION_TYPE, 1),
      deleted: data.getOrDefault(_KEY_DELETION_MARK, false),
    );

  @override
  Map<String, dynamic> deletionMark() {
    return {_KEY_DELETION_MARK: true};
  }

  @override
  String get keyUpdated => _KEY_UPDATED;
}

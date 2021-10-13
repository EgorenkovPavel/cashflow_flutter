import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/mappers/cloud_converter.dart';
import 'package:money_tracker/data/cloud/models/cloud_category.dart';

class CategoryMapper extends CloudConverter<CloudCategory> {
  static const String _KEY_TITLE = 'title';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_BUDGET_TYPE = 'budget_type';
  static const String _KEY_BUDGET = 'budget';
  static const String KEY_UPDATED = 'updated';

  const CategoryMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudCategory category) {
    return {
      _KEY_TITLE: category.title,
      _KEY_OPERATION_TYPE: category.operationType,
      _KEY_BUDGET_TYPE: category.budgetType,
      _KEY_BUDGET: category.budget,
      KEY_UPDATED: DateTime.now(),
    };
  }

  @override
  CloudCategory mapToDart(QueryDocumentSnapshot<Object?> doc) {
    return CloudCategory(
      id: doc.id,
      budgetType: doc.get(_KEY_BUDGET_TYPE),
      budget: doc.get(_KEY_BUDGET),
      title: doc.get(_KEY_TITLE),
      operationType: doc.get(_KEY_OPERATION_TYPE),
    );
  }
}

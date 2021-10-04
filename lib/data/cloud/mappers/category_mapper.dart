import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/mappers/cloud_converter.dart';
import 'package:money_tracker/data/database/budget_type_converter.dart';
import 'package:money_tracker/data/database/operation_type_converter.dart';
import 'package:money_tracker/domain/models/category.dart';

class CategoryMapper extends CloudConverter<Category> {
  static const String _KEY_TITLE = 'title';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_BUDGET_TYPE = 'budget_type';
  static const String _KEY_BUDGET = 'budget';
  static const String KEY_UPDATED = 'updated';

  const CategoryMapper();

  @override
  Map<String, dynamic> mapToCloud(Category category) {
    return {
      _KEY_TITLE: category.title,
      _KEY_OPERATION_TYPE:
      const OperationTypeConverter().mapToSql(category.operationType),
      _KEY_BUDGET_TYPE:
      const BudgetTypeConverter().mapToSql(category.budgetType),
      _KEY_BUDGET: category.budget,
      KEY_UPDATED: DateTime.now(),
    };
  }

  @override
  Category mapToDart(QueryDocumentSnapshot<Object?> doc) {
    return Category(
      cloudId: doc.id,
      budgetType:
      const BudgetTypeConverter().mapToDart(doc.get(_KEY_BUDGET_TYPE))!,
      budget: doc.get(_KEY_BUDGET),
      title: doc.get(_KEY_TITLE),
      operationType: const OperationTypeConverter()
          .mapToDart(doc.get(_KEY_OPERATION_TYPE))!,
    );
  }
}

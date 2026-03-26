// ignore_for_file: constant_identifier_names, avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/src/data/sources/remote/mappers/cloud_converter.dart';
import 'package:money_tracker/src/data/sources/remote/models/cloud_category.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class CategoryMapper extends CloudConverter<CloudCategory> {
  static const String _KEY_TITLE = 'title';
  static const String _KEY_OPERATION_TYPE = 'operation_type';
  static const String _KEY_BUDGET_TYPE = 'budget_type';
  static const String _KEY_BUDGET = 'budget';
  static const String KEY_UPDATED = 'updated';
  static const String _KEY_IS_GROUP = 'is_group';
  static const String _KEY_PARENT = 'parent';

  const CategoryMapper();

  @override
  Map<String, dynamic> mapToCloud(CloudCategory category) {
    return {
      _KEY_TITLE: category.title,
      _KEY_OPERATION_TYPE: category.operationType,
      _KEY_BUDGET_TYPE: category.budgetType,
      _KEY_BUDGET: category.budget,
      KEY_UPDATED: DateTime.now(),
      _KEY_IS_GROUP: category.isGroup,
      _KEY_PARENT: category.parent,
    };
  }

  @override
  CloudCategory mapToDart(QueryDocumentSnapshot<Object?> doc) {
    var data = doc.data() as Map<String, dynamic>;

    return CloudCategory(
      id: doc.id,
      budgetType: data.getOrDefault(_KEY_BUDGET_TYPE, 1),
      budget: data.getOrDefault(_KEY_BUDGET, 0),
      title: data.getOrDefault(_KEY_TITLE, ''),
      operationType: data.getOrDefault(_KEY_OPERATION_TYPE, 1),
      isGroup: data.getOrDefault(_KEY_IS_GROUP, false),
      parent: data.getOrDefault(_KEY_PARENT, ''),
    );
  }

  @override
  Map<String, dynamic> deletionMark() {
    throw UnimplementedError();
  }

}

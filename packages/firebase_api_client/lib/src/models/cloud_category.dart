import 'package:finance_models/finance_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_category.freezed.dart';

@freezed
abstract class CloudCategory with _$CloudCategory {
  const factory CloudCategory({
    required String id,
    required String title,
    required CategoryType type,
    required BudgetType budgetType,
    required int budget,
    required bool isGroup,
    required String? parentId,
  }) = _CloudCategory;
}

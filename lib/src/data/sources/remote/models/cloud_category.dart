import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_category.freezed.dart';

@freezed
class CloudCategory with _$CloudCategory {
  const factory CloudCategory({
    required String id,
    required String title,
    required int operationType,
    required int budgetType,
    required int budget,
    required bool deleted,
  }) = _CloudCategory;
}

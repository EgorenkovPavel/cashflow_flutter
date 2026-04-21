
import 'package:finance_models/finance_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid_value.dart';

import '../uuid_converter.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
sealed class CategoryResponse with _$CategoryResponse {
  const CategoryResponse._();

  const factory CategoryResponse.group({
    @UuidValueConverter() required UuidValue id,
    required CategoryType type,
    required String title,
  }) = CategoryGroupResponse;

  const factory CategoryResponse.item({
    @UuidValueConverter() required UuidValue id,
    required CategoryType type,
    required String title,
    required int budget,
    required BudgetType budgetType,
    @UuidValueConverter() required UuidValue? parentId,
  }) = CategoryItemResponse;

  factory CategoryResponse.fromJson(Map<String, Object?> json) => _$CategoryResponseFromJson(json);
}

@freezed
sealed class CreateCategoryRequest with _$CreateCategoryRequest {
  const factory CreateCategoryRequest.item({
    required CategoryType type,
    required String title,
    required int budget,
    required BudgetType budgetType,
    @UuidValueConverter() required UuidValue? parentId,
  }) = ItemCreateCategoryRequest;

  const factory CreateCategoryRequest.group({
    required CategoryType type,
    required String title,
  }) = GroupCreateCategoryRequest;

  factory CreateCategoryRequest.fromJson(Map<String, Object?> json) =>
      _$CreateCategoryRequestFromJson(json);
}

@freezed
sealed class UpdateCategoryRequest with _$UpdateCategoryRequest {
  const factory UpdateCategoryRequest.item({
    @UuidValueConverter() required UuidValue id,
    required String title,
    required int budget,
    required BudgetType budgetType,
    @UuidValueConverter() required UuidValue? parentId,
  }) = ItemUpdateCategoryRequest;

  const factory UpdateCategoryRequest.group({
    @UuidValueConverter() required UuidValue id,
    required String title,
  }) = GroupUpdateCategoryRequest;

  factory UpdateCategoryRequest.fromJson(Map<String, Object?> json) =>
      _$UpdateCategoryRequestFromJson(json);
}
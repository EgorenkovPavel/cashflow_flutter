import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';

import '../enum/budget_type.dart';
import '../enum/category_type.dart';

part 'category.freezed.dart';

@freezed
sealed class Category with _$Category{
  const Category._();

  const factory Category.group({
    @Default(0) int id,
    @Default('') String cloudId,
    required CategoryType type,
    required String title,
  }) = CategoryGroup;

  const factory Category.item({
    @Default(0) int id,
    @Default('') String cloudId,
    required CategoryType type,
    required String title,
    required int budget,
    required BudgetType budgetType,
    required int? parentId,
  }) = CategoryItem;

  OperationType get operationType => switch(type){
    CategoryType.INPUT => OperationType.INPUT,
    CategoryType.OUTPUT => OperationType.OUTPUT,
  };

  int? get parentId => switch(this){
    CategoryGroup() => null,
    CategoryItem(:final parentId) => parentId,
  };
}

// sealed class Category extends Equatable {
//   final int id;
//   final String cloudId;
//   final String title;
//
//   const Category({
//     required this.id,
//     required this.cloudId,
//     required this.title,
//   });
//
//   T map<T>({
//     required T Function(InputCategoryItem) inputItem,
//     required T Function(OutputCategoryItem) outputItem,
//     required T Function(InputCategoryGroup) inputGroup,
//     required T Function(OutputCategoryGroup) outputGroup,
//   }) => switch(this){
//     final InputCategoryItem item => inputItem(item),
//     final OutputCategoryItem item => outputItem(item),
//     final InputCategoryGroup group => inputGroup(group),
//     final OutputCategoryGroup group => outputGroup(group),
//   };
//
//   int? get parentId => switch (this){
//     InputCategoryItem() => parentId,
//     OutputCategoryItem() => parentId,
//     InputCategoryGroup() => null,
//     OutputCategoryGroup() => null,
//   };
//
// }
//
// sealed class CategoryItem extends Category {
//   final int budget;
//   final BudgetType budgetType;
//   final int? parentId;
//
//   const CategoryItem({
//     required super.id,
//     required super.cloudId,
//     required super.title,
//     required this.budget,
//     required this.budgetType,
//     required this.parentId,
//   });
//
//   CategoryType get type => switch(this){
//     InputCategoryItem() => CategoryType.INPUT,
//     OutputCategoryItem() => CategoryType.OUTPUT,
//   };
// }
//
// class InputCategoryItem extends CategoryItem {
//   const InputCategoryItem({
//     super.id = 0,
//     super.cloudId = '',
//     required super.title,
//     required super.budget,
//     required super.budgetType,
//     required super.parentId,
//   });
//
//   InputCategoryItem setParent(int? newParent) => InputCategoryItem(
//     id: id,
//     cloudId: cloudId,
//     title: title,
//     budget: budget,
//     budgetType: budgetType,
//     parentId: newParent,
//   );
//
//   @override
//   List<Object?> get props => [id, cloudId, title, budget, budgetType, parentId];
//
//   InputCategoryItem copyWith({
//     int? id,
//     String? cloudId,
//     String? title,
//     int? budget,
//     BudgetType? budgetType,
//   }) =>
//       InputCategoryItem(
//         id: id ?? this.id,
//         cloudId: cloudId ?? this.cloudId,
//         title: title ?? this.title,
//         budget: budget ?? this.budget,
//         budgetType: budgetType ?? this.budgetType,
//         parentId: parentId,
//       );
// }
//
// class OutputCategoryItem extends CategoryItem {
//   const OutputCategoryItem({
//     super.id = 0,
//     super.cloudId = '',
//     required super.title,
//     required super.budget,
//     required super.budgetType,
//     required super.parentId,
//   });
//
//   OutputCategoryItem setParent(int? newParent) => OutputCategoryItem(
//     id: id,
//     cloudId: cloudId,
//     title: title,
//     budget: budget,
//     budgetType: budgetType,
//     parentId: newParent,
//   );
//
//   @override
//   List<Object?> get props => [id, cloudId, title, budget, budgetType, parentId];
//
//   OutputCategoryItem copyWith({
//     int? id,
//     String? cloudId,
//     String? title,
//     int? budget,
//     BudgetType? budgetType,
//   }) =>
//       OutputCategoryItem(
//         id: id ?? this.id,
//         cloudId: cloudId ?? this.cloudId,
//         title: title ?? this.title,
//         budget: budget ?? this.budget,
//         budgetType: budgetType ?? this.budgetType,
//         parentId: parentId,
//       );
// }
//
// sealed class CategoryGroup extends Category {
//   const CategoryGroup({
//     required super.id,
//     required super.cloudId,
//     required super.title,
//   });
// }
//
// class InputCategoryGroup extends CategoryGroup {
//   const InputCategoryGroup({
//     super.id = 0,
//     super.cloudId = '',
//     required super.title,
//   });
//
//   @override
//   List<Object?> get props => [id, cloudId, title];
//
//   InputCategoryGroup copyWith({
//     int? id,
//     String? cloudId,
//     String? title,
//   }) =>
//       InputCategoryGroup(
//         id: id ?? this.id,
//         cloudId: cloudId ?? this.cloudId,
//         title: title ?? this.title,
//       );
// }
//
// class OutputCategoryGroup extends CategoryGroup {
//   const OutputCategoryGroup({
//     super.id = 0,
//     super.cloudId = '',
//     required super.title,
//   });
//
//   @override
//   List<Object?> get props => [id, cloudId, title];
//
//   OutputCategoryGroup copyWith({
//     int? id,
//     String? cloudId,
//     String? title,
//   }) =>
//       OutputCategoryGroup(
//         id: id ?? this.id,
//         cloudId: cloudId ?? this.cloudId,
//         title: title ?? this.title,
//       );
// }

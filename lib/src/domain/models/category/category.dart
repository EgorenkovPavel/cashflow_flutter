import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'category.freezed.dart';

@freezed
sealed class Category with _$Category {
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

  int get monthBudget => switch (this) {
    CategoryGroup() => 0,
    CategoryItem(:final budget, :final budgetType) =>
      (budget /
              switch (budgetType) {
                BudgetType.MONTH => 1,
                BudgetType.YEAR => 12,
              })
          .floor(),
  };

  int? get parentId => switch (this) {
    CategoryGroup() => null,
    CategoryItem(:final parentId) => parentId,
  };
}

import 'package:equatable/equatable.dart';

import '../enum/budget_type.dart';
import '../enum/category_type.dart';

sealed class Category extends Equatable {
  final int id;
  final String cloudId;
  final String title;

  const Category({
    required this.id,
    required this.cloudId,
    required this.title,
  });

  T map<T>({
    required T Function(InputCategoryItem) inputItem,
    required T Function(OutputCategoryItem) outputItem,
    required T Function(InputCategoryGroup) inputGroup,
    required T Function(OutputCategoryGroup) outputGroup,
  }) => switch(this){
    InputCategoryItem() => inputItem(this as InputCategoryItem),
    OutputCategoryItem() => outputItem(this as OutputCategoryItem),
    InputCategoryGroup() => inputGroup(this as InputCategoryGroup),
    OutputCategoryGroup() => outputGroup(this as OutputCategoryGroup),
  };
}

sealed class CategoryItem extends Category {
  final int budget;
  final BudgetType budgetType;
  final int? parentId;

  const CategoryItem({
    required super.id,
    required super.cloudId,
    required super.title,
    required this.budget,
    required this.budgetType,
    required this.parentId,
  });

  CategoryType get type => switch(this){
    InputCategoryItem() => CategoryType.INPUT,
    OutputCategoryItem() => CategoryType.OUTPUT,
  };
}

class InputCategoryItem extends CategoryItem {
  const InputCategoryItem({
    super.id = 0,
    super.cloudId = '',
    required super.title,
    required super.budget,
    required super.budgetType,
    required super.parentId,
  });

  InputCategoryItem setParent(int? newParent) => InputCategoryItem(
    id: id,
    cloudId: cloudId,
    title: title,
    budget: budget,
    budgetType: budgetType,
    parentId: newParent,
  );

  @override
  List<Object?> get props => [id, cloudId, title, budget, budgetType, parentId];

  InputCategoryItem copyWith({
    int? id,
    String? cloudId,
    String? title,
    int? budget,
    BudgetType? budgetType,
  }) =>
      InputCategoryItem(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        budget: budget ?? this.budget,
        budgetType: budgetType ?? this.budgetType,
        parentId: parentId,
      );
}

class OutputCategoryItem extends CategoryItem {
  const OutputCategoryItem({
    super.id = 0,
    super.cloudId = '',
    required super.title,
    required super.budget,
    required super.budgetType,
    required super.parentId,
  });

  OutputCategoryItem setParent(int? newParent) => OutputCategoryItem(
    id: id,
    cloudId: cloudId,
    title: title,
    budget: budget,
    budgetType: budgetType,
    parentId: newParent,
  );

  @override
  List<Object?> get props => [id, cloudId, title, budget, budgetType, parentId];

  OutputCategoryItem copyWith({
    int? id,
    String? cloudId,
    String? title,
    int? budget,
    BudgetType? budgetType,
  }) =>
      OutputCategoryItem(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        budget: budget ?? this.budget,
        budgetType: budgetType ?? this.budgetType,
        parentId: parentId,
      );
}

sealed class CategoryGroup extends Category {
  const CategoryGroup({
    required super.id,
    required super.cloudId,
    required super.title,
  });
}

class InputCategoryGroup extends CategoryGroup {
  const InputCategoryGroup({
    super.id = 0,
    super.cloudId = '',
    required super.title,
  });

  @override
  List<Object?> get props => [id, cloudId, title];

  InputCategoryGroup copyWith({
    int? id,
    String? cloudId,
    String? title,
  }) =>
      InputCategoryGroup(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
      );
}

class OutputCategoryGroup extends CategoryGroup {
  const OutputCategoryGroup({
    super.id = 0,
    super.cloudId = '',
    required super.title,
  });

  @override
  List<Object?> get props => [id, cloudId, title];

  OutputCategoryGroup copyWith({
    int? id,
    String? cloudId,
    String? title,
  }) =>
      OutputCategoryGroup(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
      );
}

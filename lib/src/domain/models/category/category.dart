import 'package:equatable/equatable.dart';

import '../enum/budget_type.dart';
import '../enum/operation_type.dart';

sealed class Category extends Equatable {
  final int id;
  final String cloudId;
  final String title;

  const Category({
    required this.id,
    required this.cloudId,
    required this.title,
  });
}

sealed class CategoryItem extends Category {
  final int budget;
  final BudgetType budgetType;
  final CategoryGroup? parent;

  const CategoryItem({
    required super.id,
    required super.cloudId,
    required super.title,
    required this.budget,
    required this.budgetType,
    required this.parent,
  });

  OperationType get type => switch(this){
    InputCategoryItem() => OperationType.INPUT,
    OutputCategoryItem() => OperationType.OUTPUT,
  };
}

class InputCategoryItem extends CategoryItem {
  const InputCategoryItem({
    super.id = 0,
    super.cloudId = '',
    required super.title,
    required super.budget,
    required super.budgetType,
    required InputCategoryGroup? super.parent,
  });

  @override
  InputCategoryGroup? get parent => parent;

  InputCategoryItem setParent(InputCategoryGroup? newParent) => InputCategoryItem(
    id: id,
    cloudId: cloudId,
    title: title,
    budget: budget,
    budgetType: budgetType,
    parent: newParent,
  );

  @override
  List<Object?> get props => [id, cloudId, title, budget, budgetType, parent];

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
        parent: this.parent,
      );
}

class OutputCategoryItem extends CategoryItem {
  const OutputCategoryItem({
    super.id = 0,
    super.cloudId = '',
    required super.title,
    required super.budget,
    required super.budgetType,
    required OutputCategoryGroup? super.parent,
  });

  @override
  OutputCategoryGroup? get parent => parent;

  OutputCategoryItem setParent(OutputCategoryGroup? newParent) => OutputCategoryItem(
    id: id,
    cloudId: cloudId,
    title: title,
    budget: budget,
    budgetType: budgetType,
    parent: newParent,
  );

  @override
  List<Object?> get props => [id, cloudId, title, budget, budgetType, parent];

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
        parent: this.parent,
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

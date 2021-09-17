import 'package:money_tracker/domain/models.dart';

import 'operation_type.dart';

class Category {
  final int id;
  final String? cloudId;
  final String title;
  final OperationType operationType;
  final BudgetType budgetType;
  final int budget;

  const Category({
    required this.budgetType,
    required this.budget,
    this.id = 0,
    this.cloudId = '',
    required this.title,
    required this.operationType,
  });

  Category copyWith({
    int? id,
    String? cloudId,
    String? title,
    OperationType? operationType,
    BudgetType? budgetType,
    int? budget,
  }) =>
      Category(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        operationType: operationType ?? this.operationType,
        budgetType: budgetType ?? this.budgetType,
        budget: budget ?? this.budget,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

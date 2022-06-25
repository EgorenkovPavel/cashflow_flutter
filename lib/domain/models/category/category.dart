import 'package:equatable/equatable.dart';
import 'package:money_tracker/domain/models.dart';

class Category extends Equatable{
  final int id;
  final String cloudId;
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
  List<Object?> get props => [id, cloudId, title, operationType, budgetType, budget];
}

class CloudCategory {
  final String id;
  final String title;
  final int operationType;
  final int budgetType;
  final int budget;
  final bool deleted;

  CloudCategory({
    required this.id,
    required this.title,
    required this.operationType,
    required this.budgetType,
    required this.budget,
    required this.deleted,
  });

  CloudCategory copyWith({
    String? id,
    String? title,
    int? operationType,
    int? budgetType,
    int? budget,
    bool? deleted,
  }) =>
      CloudCategory(
        id: id ?? this.id,
        title: title ?? this.title,
        operationType: operationType ?? this.operationType,
        budgetType: budgetType ?? this.budgetType,
        budget: budget ?? this.budget,
        deleted: deleted ?? this.deleted,
      );
}

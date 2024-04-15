import 'cloud_entity.dart';

class Category implements CloudEntity{
  final String id;
  final String title;
  final int operationType;
  final int budgetType;
  final int budget;
  final String currency;
  final bool deleted;

  Category(
      {required this.id,
      required this.title,
      required this.operationType,
      required this.budgetType,
      required this.budget,
      required this.currency,
      required this.deleted});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          operationType == other.operationType &&
          budgetType == other.budgetType &&
          budget == other.budget &&
          currency == other.currency &&
          deleted == other.deleted;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      operationType.hashCode ^
      budgetType.hashCode ^
      budget.hashCode ^
      currency.hashCode ^
      deleted.hashCode;
}

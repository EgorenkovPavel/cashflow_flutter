import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category({
    required this.id,
    required this.title,
    required this.budget,
    required this.budgetType,
    required this.parentId,
    required this.groupId,
  });

  final String id;
  final String title;
  final int budget;
  final BudgetType budgetType;
  final String? parentId;
  final String groupId;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

enum BudgetType { MONTH, YEAR }

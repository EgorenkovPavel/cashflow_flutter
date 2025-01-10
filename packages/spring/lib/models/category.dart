import 'package:spring/models/models.dart';

typedef CategoryId = AnalyticId;

class Category {
  final CategoryId? id;
  final String name;
  final CategoryType type;
  final int budget;
  final bool isGroup;
  final CategoryId? parent;
  final UserGroupId userGroup;

  Category(
      {required this.id,
      required this.name,
      required this.type,
      required this.budget,
      required this.isGroup,
      required this.parent,
      required this.userGroup});
}

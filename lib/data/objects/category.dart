import 'package:cashflow/data/objects/operation_type.dart';

class Category{

  final int id;
  final String title;
  final OperationType type;

  const Category({this.id = 0, required this.title, required this.type});

  Category copyWith({int? id, String? title, OperationType? type}) => Category(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Category &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}
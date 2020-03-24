import 'package:cashflow/data/operation_type.dart';

class Category{

  final int id;
  final String title;
  final bool archive;
  final OperationType type;

  const Category({this.id, this.title, this.archive, this.type});

  Category copyWith({int id, String title, bool archive, OperationType type}) => Category(
    id: id ?? this.id,
    title: title ?? this.title,
    archive: archive ?? this.archive,
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
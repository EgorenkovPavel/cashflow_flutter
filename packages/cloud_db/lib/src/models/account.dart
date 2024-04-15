
import 'package:cloud_db/src/models/cloud_entity.dart';

class Account implements CloudEntity{
  @override
  final String id;
  final String title;
  final bool isDebt;
  final String currency;
  final bool deleted;

  Account({
    required this.id,
    required this.title,
    required this.isDebt,
    required this.currency,
    required this.deleted,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          isDebt == other.isDebt &&
          currency == other.currency &&
          deleted == other.deleted;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      isDebt.hashCode ^
      currency.hashCode ^
      deleted.hashCode;
}

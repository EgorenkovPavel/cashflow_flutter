import 'cloud_entity.dart';

class Operation implements CloudEntity {
  final String id;
  final DateTime date;
  final int operationType;
  final String account;
  final String? category;
  final String? recAccount;
  final int sum;
  final int? recSum;
  final bool deleted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Operation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          date == other.date &&
          operationType == other.operationType &&
          account == other.account &&
          category == other.category &&
          recAccount == other.recAccount &&
          sum == other.sum &&
          recSum == other.recSum &&
          deleted == other.deleted;

  @override
  int get hashCode =>
      id.hashCode ^
      date.hashCode ^
      operationType.hashCode ^
      account.hashCode ^
      category.hashCode ^
      recAccount.hashCode ^
      sum.hashCode ^
      recSum.hashCode ^
      deleted.hashCode;

  Operation(
      {required this.id,
      required this.date,
      required this.operationType,
      required this.account,
      required this.category,
      required this.recAccount,
      required this.sum,
      required this.recSum,
      required this.deleted});
}

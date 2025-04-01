import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'operation_entity.freezed.dart';

@freezed
class OperationDbEntity with _$OperationDbEntity {
  const OperationDbEntity._();

  const factory OperationDbEntity({
    required OperationDB operation,
    required AccountDB account,
    CategoryDB? category,
    AccountDB? recAccount,
  }) = _OperationDbEntity;

  // //TODO rewrite to date, type, account, category, recAccount sum
  OperationDB get operationData {
    switch (operation.operationType) {
      case OperationType.INPUT:
      case OperationType.OUTPUT:
        return operation.copyWith(
            account: account.id, category: drift.Value(category!.id));
      case OperationType.TRANSFER:
        return operation.copyWith(
          account: account.id,
          recAccount: drift.Value(recAccount!.id),
        );
    }
  }

  DateTime get date => operation.date;

  bool get synced => operation.synced;

  OperationType get type => operation.operationType;

  int get sum => operation.sum;

  int get recSum => operation.recSum;
}

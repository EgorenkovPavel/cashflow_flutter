import 'package:drift/drift.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/domain/models.dart';

class OperationDbEntity {
  final OperationDB operation;
  final AccountDB account;
  final CategoryDB? category;
  final AccountDB? recAccount;

  OperationDbEntity(
      {required this.operation,
        required this.account,
        this.category,
        this.recAccount});

  //TODO rewrite to date, type, account, category, recAccount sum
  OperationDB get operationData {
    switch (operation.operationType) {
      case OperationType.INPUT:
      case OperationType.OUTPUT:
        return operation.copyWith(account: account.id, category: category!.id);
      case OperationType.TRANSFER:
        return operation.copyWith(
            account: account.id, recAccount: recAccount!.id);
      default:
        throw InvalidDataException('');
    }
  }

  DateTime get date => operation.date;

  bool get synced => operation.synced;

  OperationType get type => operation.operationType;

  int get sum => operation.sum;

}

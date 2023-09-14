import 'package:drift/drift.dart';
import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/domain/models.dart';

class OperationItem {
  OperationDB operation;
  AccountDB account;
  CategoryDB? category;
  AccountDB? recAccount;

  OperationItem(
      {required this.operation,
        required this.account,
        this.category,
        this.recAccount});

  //TODO rewrite to date, type, account, category, recAccount sum
  OperationDB get operationData {
    switch (operation.operationType) {
      case OperationType.INPUT:
      case OperationType.OUTPUT:
        return operation.copyWith(account: account.id, category: Value(category!.id));
      case OperationType.TRANSFER:
        return operation.copyWith(
            account: account.id, recAccount: Value(recAccount!.id));
    }
  }

  DateTime get date => operation.date;

  bool get synced => operation.synced;

  OperationType get type => operation.operationType;

  int get sum => operation.sum;

  set date(DateTime value) {
    operation = operation.copyWith(date: value);
  }

  set type(OperationType value) {
    operation = operation.copyWith(operationType: value);
  }

  set sum(int value) {
    operation = operation.copyWith(sum: value);
  }
}

import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:money_tracker/src/data/sources/local/entities/operation_entity.dart';
import 'package:money_tracker/src/domain/models.dart';

import 'account_mapper.dart';
import 'category_mapper.dart';
import 'mapper.dart';

class OperationMapper extends Mapper<Operation, OperationDbEntity> {
  const OperationMapper();

  @override
  OperationDbEntity mapToSql(Operation o) {
    return o.map(
      input: (o) => OperationDbEntity(
        operation: mapToOperationData(o),
        account: const AccountMapper().mapToSql(o.account),
        category: const CategoryMapper().mapToSql(o.category),
        recAccount: null,
      ),
      output: (o) => OperationDbEntity(
        operation: mapToOperationData(o),
        account: const AccountMapper().mapToSql(o.account),
        category: const CategoryMapper().mapToSql(o.category),
        recAccount: null,
      ),
      transfer: (o) => OperationDbEntity(
        operation: mapToOperationData(o),
        account: const AccountMapper().mapToSql(o.account),
        category: null,
        recAccount: const AccountMapper().mapToSql(o.recAccount),
      ),
    );
  }

  @override
  Operation mapToDart(OperationDbEntity o) {
    return o.operationData.operationType.map(
      INPUT: () => Operation.input(
        id: o.operationData.id,
        cloudId: o.operation.cloudId,
        synced: o.synced,
        deleted: o.operation.deleted,
        date: o.operationData.date,
        account: const AccountMapper().mapToDart(o.account),
        category: const CategoryMapper().mapToDart(o.category!),
        sum: o.operationData.sum,
      ),
      OUTPUT: () => Operation.output(
        id: o.operationData.id,
        cloudId: o.operation.cloudId,
        synced: o.synced,
        deleted: o.operation.deleted,
        date: o.operationData.date,
        account: const AccountMapper().mapToDart(o.account),
        category: const CategoryMapper().mapToDart(o.category!),
        sum: o.operationData.sum,
      ),
      TRANSFER: () => Operation.transfer(
        id: o.operationData.id,
        cloudId: o.operation.cloudId,
        synced: o.synced,
        deleted: o.operation.deleted,
        date: o.operationData.date,
        account: const AccountMapper().mapToDart(o.account),
        recAccount: const AccountMapper().mapToDart(o.recAccount!),
        sum: o.operationData.sum,
      ),
    );
  }

  OperationDB mapToOperationData(Operation o) {
    return o.map(
      input: (o) => OperationDB(
        id: o.id,
        cloudId: o.cloudId,
        date: o.date,
        operationType: o.type,
        account: o.account.id,
        category: o.category.id,
        recAccount: null,
        sum: o.sum,
        synced: false,
        deleted: o.deleted,
      ),
      output: (o) => OperationDB(
        id: o.id,
        cloudId: o.cloudId,
        date: o.date,
        operationType: o.type,
        account: o.account.id,
        category: o.category.id,
        recAccount: null,
        sum: o.sum,
        synced: false,
        deleted: o.deleted,
      ),
      transfer: (o) => OperationDB(
        id: o.id,
        cloudId: o.cloudId,
        date: o.date,
        operationType: o.type,
        account: o.account.id,
        category: null,
        recAccount: o.recAccount.id,
        sum: o.sum,
        synced: false,
        deleted: o.deleted,
      ),
    );
  }
}

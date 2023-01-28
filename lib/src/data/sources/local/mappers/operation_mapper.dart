// ignore_for_file: avoid_renaming_method_parameters

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
    return OperationDbEntity(
      operation: mapToOperationData(o),
      account: const AccountMapper().mapToSql(o.account),
      category: o.category == null
          ? null
          : const CategoryMapper().mapToSql(o.category!),
      recAccount: o.recAccount == null
          ? null
          : const AccountMapper().mapToSql(o.recAccount!),
    );
  }

  @override
  Operation mapToDart(OperationDbEntity o) {
    return Operation(
      id: o.operationData.id,
      cloudId: o.operation.cloudId,
      synced: o.synced,
      deleted: o.operation.deleted,
      date: o.operationData.date,
      type: o.operationData.operationType,
      account: const AccountMapper().mapToDart(o.account),
      category: o.category == null
          ? null
          : const CategoryMapper().mapToDart(o.category!),
      recAccount: o.recAccount == null
          ? null
          : const AccountMapper().mapToDart(o.recAccount!),
      sum: o.operationData.sum,
    );
  }

  OperationDB mapToOperationData(Operation o) {
    return OperationDB(
      id: o.id,
      cloudId: o.cloudId,
      date: o.date,
      operationType: o.type,
      account: o.account.id,
      category: o.category?.id,
      recAccount: o.recAccount?.id,
      sum: o.sum,
      synced: false,
      deleted: o.deleted,
    );
  }
}

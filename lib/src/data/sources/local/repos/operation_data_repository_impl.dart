import 'package:drift/drift.dart';

import '../../../../domain/models.dart';
import '../../../interfaces/local_sync_source.dart';
import '../data/database.dart';
import '../data/operation_dao.dart';
import '../data/user_dao.dart';
import '../db_mapper.dart' show OperationMapper;

class OperationDataRepositoryImpl implements LocalSyncTable<Operation> {
  final OperationDao operationDao;
  final UserDao userDao;

  OperationDataRepositoryImpl(this.operationDao, this.userDao);

  @override
  Future<List<Operation>> getAllWithEmptyCloudId() async {
    final operations =
        await operationDao.getAllOperationItemsWithEmptyCloudId();
    return OperationMapper().entityListToModel(operations);
  }

  @override
  Future<Operation?> getByCloudId(String cloudId) async {
    final operation = await operationDao.getOperationByCloudId(cloudId);

    if (operation == null) {
      return null;
    }

    return OperationMapper().entityToModel(operation);
  }

  @override
  Future<List<Operation>> getAllNotSynced() async {
    final operations = await operationDao.getAllOperationItemsNotSynced();
    return OperationMapper().entityListToModel(operations);
  }

  @override
  Future markAsSynced(int operationId, String cloudId) {
    return operationDao.markAsSynced(operationId, cloudId);
  }

  @override
  Future insertFromCloud(Operation operation) {
    return operationDao.insertOperation(
      operation.map(
        input: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          category: Value(o.analytic),
          sum: Value(o.sum.sum),
          synced: const Value(true),
          currencySent: Value(o.sum.currency),
          deleted: Value(operation.deleted),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          category: Value(o.analytic),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          recAccount: Value(o.analytic),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
          recSum: Value(o.recSum.sum),
          currencyReceived: Value(o.recSum.currency),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
      ),
    );
  }

  @override
  Future updateFromCloud(Operation operation) {
    return operationDao.updateFields(
      operation.id,
      operation.map(
        input: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          category: Value(o.analytic),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          category: Value(o.analytic),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account),
          recAccount: Value(o.analytic),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
          recSum: Value(o.recSum.sum),
          currencyReceived: Value(o.recSum.currency),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
      ),
    );
  }
}

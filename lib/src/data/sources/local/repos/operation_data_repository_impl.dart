import 'package:drift/drift.dart';

import '../../../../domain/models.dart';
import '../../../interfaces/local_sync_source.dart';
import '../data/database.dart';
import '../data/operation_dao.dart';
import '../data/user_dao.dart';
import '../mapper_db.dart';

class OperationDataRepositoryImpl implements LocalSyncTable<Operation> {
  final OperationDao operationDao;
  final UserDao userDao;

  OperationDataRepositoryImpl(this.operationDao, this.userDao);

  @override
  Future<List<Operation>> getAllWithEmptyCloudId() async {
    final operations =
        await operationDao.getAllOperationItemsWithEmptyCloudId();
    final users = await userDao.getAllUsers();
    return MapperDB.mapOperationList(operations, users);
  }

  @override
  Future<Operation?> getByCloudId(String cloudId) async {
    final operation = await operationDao.getOperationByCloudId(cloudId);

    if (operation == null) {
      return null;
    }

    final users = await userDao.getAllUsers();
    return MapperDB.mapOperation(operation, users);
  }

  @override
  Future<List<Operation>> getAllNotSynced() async {
    final operations = await operationDao.getAllOperationItemsNotSynced();
    final users = await userDao.getAllUsers();

    return MapperDB.mapOperationList(operations, users);
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
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          recAccount: Value(o.recAccount.id),
          sum: Value(o.sum),
          recSum: Value(o.recSum),
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
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          recAccount: Value(o.recAccount.id),
          sum: Value(o.sum),
          recSum: Value(o.recSum),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ),
      ),
    );
  }
}

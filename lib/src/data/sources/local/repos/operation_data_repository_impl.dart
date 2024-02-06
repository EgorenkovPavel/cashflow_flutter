import 'package:drift/drift.dart';
import '../../../../domain/interfaces/data/operation_data_repository.dart';
import '../data/database.dart';
import '../data/operation_dao.dart';
import '../entities/operation_entity.dart';
import '../../../interfaces/local_sync_source.dart';
import '../mappers/operation_mapper.dart';
import '../../../../domain/models.dart';

class OperationDataRepositoryImpl
    implements LocalSyncTable<Operation>, OperationDataRepository {
  final OperationDao operationDao;

  OperationDataRepositoryImpl(this.operationDao);

  List<Operation> _mapOperationList(List<OperationDbEntity> list) =>
      const OperationMapper().mapListToDart(list);

  Operation _mapOperation(OperationDbEntity item) =>
      const OperationMapper().mapToDart(item);

  OperationDB _mapOperationDB(Operation item) =>
      const OperationMapper().mapToOperationData(item);

  @override
  Future<List<Operation>> getAll() =>
      operationDao.getAllOperationItems().then(_mapOperationList);

  @override
  Future<List<Operation>> getAllWithEmptyCloudId() => operationDao
      .getAllOperationItemsWithEmptyCloudId()
      .then(_mapOperationList);

  @override
  Stream<List<Operation>> watchAll() =>
      operationDao.watchAllOperationItems().map(_mapOperationList);

  @override
  Stream<List<Operation>> watchAllByFilter(OperationListFilter filter) =>
      operationDao
          .watchAllOperationItemsByFilter(
            start: filter.period?.start,
            end: filter.period?.end,
            accountIds: filter.accounts.map((account) => account.id).toSet(),
            categoriesIds:
                filter.categories.map((category) => category.id).toSet(),
          )
          .map(_mapOperationList);

  @override
  Future<Operation> getById(int id) =>
      operationDao.getOperationById(id).then((value) => _mapOperation(value));

  @override
  Future<Operation?> getByCloudId(String cloudId) async {
    final operation = await operationDao.getOperationByCloudId(cloudId);

    return operation == null ? null : _mapOperation(operation);
  }

  @override
  Stream<List<Operation>> watchAllByAccount(int accountId) => operationDao
      .watchAllOperationItemsByAccount(accountId)
      .map(_mapOperationList);

  @override
  Stream<List<Operation>> watchAllByCategory(int categoryId) => operationDao
      .watchAllOperationItemsByCategory(categoryId)
      .map(_mapOperationList);

  @override
  Stream<List<Operation>> watchLast(int limit) =>
      operationDao.watchLastOperationItems(limit).map(_mapOperationList);

  @override
  Future<Operation?> getLast() => operationDao
      .getLastOperationItem()
      .then((value) => value == null ? null : _mapOperation(value));

  @override
  Future<Operation> insert(Operation entity) async {
    final id = await operationDao.insertOperation(
      entity.map(
        input: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          category: Value(o.category.id),
          sum: Value(o.sum),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.type),
          account: Value(o.account.id),
          recAccount: Value(o.recAccount.id),
          sum: Value(o.sum),
          recSum: Value(o.recSum),
        ),
      ),
    );

    return entity.copyWith(id: id);
  }

  @override
  Future<Operation> duplicate(Operation entity) {
    var newOperation = entity.copyWith(
      id: 0,
      cloudId: '',
      date: DateTime.now(),
    );

    return insert(newOperation);
  }

  @override
  Future update(Operation operation) =>
      operationDao.updateOperation(_mapOperationDB(operation));

  @override
  Future delete(Operation entity) =>
      operationDao.deleteOperation(_mapOperationDB(entity));

  @override
  Future deleteById(int operationId) =>
      operationDao.deleteOperationById(operationId);

  @override
  Future recover(Operation entity) =>
      operationDao.recoverOperation(_mapOperationDB(entity));

  @override
  Future<List<Operation>> getAllNotSynced() async {
    return _mapOperationList(
      await operationDao.getAllOperationItemsNotSynced(),
    );
  }

  @override
  Future markAsSynced(int operationId, String cloudId) {
    return operationDao.markAsSynced(operationId, cloudId);
  }

  @override
  Stream<Operation> watchNotSynced() {
    return operationDao
        .watchOperationItemsNotSynced()
        .map((event) => _mapOperation(event));
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

import 'package:drift/drift.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/data/local/data/operation_dao.dart';
import 'package:money_tracker/data/local/data/operation_item.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/mappers/operation_mapper.dart';
import 'package:money_tracker/domain/models.dart';

class OperationRepository implements LocalSyncTable<Operation>, OperationDataSource {
  final OperationDao operationDao;

  OperationRepository(this.operationDao);

  final List<Operation> Function(List<OperationItem>) _mapOperationList =
      (list) => const OperationMapper().mapListToDart(list);

  final Operation Function(OperationItem) _mapOperation =
      (item) => const OperationMapper().mapToDart(item);

  final OperationDB Function(Operation) _mapOperationDB =
      (item) => const OperationMapper().mapToOperationData(item);

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
                  filter.categories.map((category) => category.id).toSet())
          .map(_mapOperationList);

  @override
  Future<Operation> getById(int id) =>
      operationDao.getOperationById(id).then((value) => _mapOperation(value));

  @override
  Future<Operation?> getByCloudId(String cloudId) =>
      operationDao.getOperationByCloudId(cloudId).then((value) {
        if (value == null) {
          return null;
        } else {
          return _mapOperation(value);
        }
      });

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
    final _id = await operationDao.insertOperation(OperationsCompanion(
      cloudId: Value(entity.cloudId),
      date: Value(entity.date),
      operationType: Value(entity.type),
      account: Value(entity.account.id),
      category: Value(entity.category?.id),
      recAccount: Value(entity.recAccount?.id),
      sum: Value(entity.sum),
    ));
    return entity.copyWith(id: _id);
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
  Future<List<Operation>> getAllNotSynced() async {
    return _mapOperationList(
        await operationDao.getAllOperationItemsNotSynced());
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
    return operationDao.insertOperation(OperationsCompanion(
      cloudId: Value(operation.cloudId),
      date: Value(operation.date),
      operationType: Value(operation.type),
      account: Value(operation.account.id),
      category: Value(operation.category?.id),
      recAccount: Value(operation.recAccount?.id),
      sum: Value(operation.sum),
      synced: const Value(true),
      deleted: Value(operation.deleted),
    ));
  }

  @override
  Future updateFromCloud(Operation operation) {
    return operationDao.updateFields(
        operation.id,
        OperationsCompanion(
          cloudId: Value(operation.cloudId),
          date: Value(operation.date),
          operationType: Value(operation.type),
          account: Value(operation.account.id),
          category: Value(operation.category?.id),
          recAccount: Value(operation.recAccount?.id),
          sum: Value(operation.sum),
          synced: const Value(true),
          deleted: Value(operation.deleted),
        ));
  }

}

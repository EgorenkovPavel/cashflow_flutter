import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/data/local/data/operation_dao.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/mappers/operation_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:moor/moor.dart';

class OperationRepository extends LocalOperationsRepo{
  final OperationDao operationDao;

  OperationRepository(this.operationDao);

  final List<Operation> Function(List<OperationItem>) _mapOperationList =
      (list) => const OperationMapper().mapListToDart(list);

  final Operation Function(OperationItem) _mapOperation =
      (item) => const OperationMapper().mapToDart(item);

  final OperationDB Function(Operation) _mapOperationDB =
      (item) => const OperationMapper().mapToOperationData(item);

  Future<List<Operation>> getAll() =>
      operationDao.getAllOperationItems().then(_mapOperationList);

  Future<List<Operation>> getAllWithEmptyCloudId() =>
      operationDao.getAllOperationItemsWithEmptyCloudId().then(_mapOperationList);

  Stream<List<Operation>> watchAll() =>
      operationDao.watchAllOperationItems().map(_mapOperationList);

  Stream<List<Operation>> watchAllByFilter(OperationListFilter filter) =>
      operationDao
          .watchAllOperationItemsByFilter(
              start: filter.date?.start,
              end: filter.date?.end,
              accountIds: filter.accountsIds,
              categoriesIds: filter.categoriesIds)
          .map(_mapOperationList);

  Future<Operation> getById(int id) =>
      operationDao.getOperationById(id).then((value) => _mapOperation(value));

  Future<Operation?> getByCloudId(String cloudId) =>
      operationDao.getOperationByCloudId(cloudId).then((value) {
        if (value == null) {
          return null;
        } else {
          return _mapOperation(value);
        }
      });

  Stream<List<Operation>> watchAllByAccount(int accountId) => operationDao
      .watchAllOperationItemsByAccount(accountId)
      .map(_mapOperationList);

  Stream<List<Operation>> watchAllByCategory(int categoryId) => operationDao
      .watchAllOperationItemsByCategory(categoryId)
      .map(_mapOperationList);

  Stream<List<Operation>> watchLast(int limit) =>
      operationDao.watchLastOperationItems(limit).map(_mapOperationList);

  Future<Operation?> getLast() => operationDao
      .getLastOperationItem()
      .then((value) => value == null ? null : _mapOperation(value));

  Future<int> insert(Operation entity) {
    return operationDao.insertOperation(OperationsCompanion(
        cloudId: Value(entity.cloudId),
        date: Value(entity.date),
        operationType: Value(entity.type),
        account: Value(entity.account.id),
        category: Value(entity.category?.id),
        recAccount: Value(entity.recAccount?.id),
        sum: Value(entity.sum)));
  }

  Future update(Operation operation) =>
      operationDao.updateOperation(_mapOperationDB(operation));

  Future delete(Operation entity) =>
      operationDao.deleteOperation(_mapOperationDB(entity));

  Future deleteById(int operationId) =>
      operationDao.deleteOperationById(operationId);
}

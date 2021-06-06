import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/operation_mapper.dart';
import 'package:money_tracker/domain/models.dart';

class OperationRepository {
  final Database db;

  OperationRepository(this.db);

  final List<Operation> Function(List<OperationItem>) _mapOperationList =
      (list) => const OperationMapper().mapListToDart(list);

  final Operation Function(OperationItem) _mapOperation =
      (item) => const OperationMapper().mapToDart(item);

  final OperationDB Function(Operation) _mapOperationDB =
      (item) => const OperationMapper().mapToOperationData(item);

  Stream<List<Operation>> watchAll() =>
      db.operationDao.watchAllOperationItems().map(_mapOperationList);

  Stream<List<Operation>> watchAllByFilter(
      OperationListFilter filter) =>
      db.operationDao
          .watchAllOperationItemsByFilter(
          start: filter.date?.start,
          end: filter.date?.end,
          accountIds: filter.accountsIds,
          categoriesIds: filter.categoriesIds)
          .map(_mapOperationList);

  Stream<Operation> getById(int id) =>
      db.operationDao.getOperationById(id).map(_mapOperation);

  Stream<List<Operation>> watchAllByAccount(int accountId) =>
      db.operationDao
          .watchAllOperationItemsByAccount(accountId)
          .map(_mapOperationList);

  Stream<List<Operation>> watchAllByCategory(int categoryId) =>
      db.operationDao
          .watchAllOperationItemsByCategory(categoryId)
          .map(_mapOperationList);

  Stream<List<Operation>> watchLast(int limit) =>
      db.operationDao.watchLastOperationItems(limit).map(_mapOperationList);

  Future<Operation?> getLast() => db.operationDao
      .getLastOperationItem()
      .then((value) => value == null ? null : _mapOperation(value));

  Future<int> insert(Operation entity) {
    if ((entity.id) == 0) {
      return db.operationDao.insertOperation(_mapOperationDB(entity));
    } else {
      return db.operationDao.updateOperation(_mapOperationDB(entity));
    }
  }

  Future duplicate(Operation entity) {
    var newOperation = Operation(
      id: 0,
      date: DateTime.now(),
      type: entity.type,
      account: entity.account,
      category: entity.category,
      recAccount: entity.recAccount,
      sum: entity.sum,
    );
    return db.operationDao.insertOperation(_mapOperationDB(newOperation));
  }

  Future delete(Operation entity) =>
      db.operationDao.deleteOperation(_mapOperationDB(entity));

  Future deleteById(int operationId) =>
      db.operationDao.deleteOperationById(operationId);
}

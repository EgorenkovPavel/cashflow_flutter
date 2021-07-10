import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/database/operation_dao.dart';
import 'package:money_tracker/data/mappers/operation_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:moor/moor.dart';

class OperationRepository {
  final OperationDao operationDao;

  OperationRepository(this.operationDao);

  final List<Operation> Function(List<OperationItem>) _mapOperationList =
      (list) => const OperationMapper().mapListToDart(list);

  final Operation Function(OperationItem) _mapOperation =
      (item) => const OperationMapper().mapToDart(item);

  final OperationDB Function(Operation) _mapOperationDB =
      (item) => const OperationMapper().mapToOperationData(item);

  Stream<List<Operation>> watchAll() =>
      operationDao.watchAllOperationItems().map(_mapOperationList);

  Stream<List<Operation>> watchAllByFilter(
      OperationListFilter filter) =>
      operationDao
          .watchAllOperationItemsByFilter(
          start: filter.date?.start,
          end: filter.date?.end,
          accountIds: filter.accountsIds,
          categoriesIds: filter.categoriesIds)
          .map(_mapOperationList);

  Stream<Operation> getById(int id) =>
      operationDao.getOperationById(id).map(_mapOperation);

  Stream<List<Operation>> watchAllByAccount(int accountId) =>
      operationDao
          .watchAllOperationItemsByAccount(accountId)
          .map(_mapOperationList);

  Stream<List<Operation>> watchAllByCategory(int categoryId) =>
      operationDao
          .watchAllOperationItemsByCategory(categoryId)
          .map(_mapOperationList);

  Stream<List<Operation>> watchLast(int limit) =>
      operationDao.watchLastOperationItems(limit).map(_mapOperationList);

  Future<Operation?> getLast() => operationDao
      .getLastOperationItem()
      .then((value) => value == null ? null : _mapOperation(value));

  Future<int> insert(Operation entity) {
    if ((entity.id) == 0) {
      return operationDao.insertOperation(
        OperationsCompanion(
          date: Value(entity.date),
          operationType: Value(entity.type),
          account: Value(entity.account.id),
          category: Value(entity.category?.id),
          recAccount: Value(entity.recAccount?.id),
          sum: Value(entity.sum)
        )
      );
    } else {
      return operationDao.updateOperation(_mapOperationDB(entity));
    }
  }

  Future duplicate(Operation entity) {
    var newOperation = OperationsCompanion(
      date: Value(DateTime.now()),
      operationType: Value(entity.type),
      account: Value(entity.account.id),
      category: Value(entity.category?.id),
      recAccount: Value(entity.recAccount?.id),
      sum: Value(entity.sum),
    );
    return operationDao.insertOperation(newOperation);
  }

  Future delete(Operation entity) =>
      operationDao.deleteOperation(_mapOperationDB(entity));

  Future deleteById(int operationId) =>
      operationDao.deleteOperationById(operationId);
}

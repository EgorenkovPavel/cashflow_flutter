import 'package:drift/drift.dart';

import '../../domain/interfaces/operation_repository.dart';
import '../../domain/models.dart';
import '../sources/local/data/operation_dao.dart';
import '../sources/local/db_mapper.dart';
import '../sources/local/data/database.dart';

/// Implementation of [OperationRepository] using [OperationDao] and [OperationMapper].
class OperationRepositoryImpl implements OperationRepository {
  final OperationDao _operationDao;

  OperationRepositoryImpl(this._operationDao);

  @override
  Future<void> deleteById(int operationId) =>
      _operationDao.deleteOperationById(operationId);

  @override
  Future<Operation> duplicate(int operationId) async {
    final entity = await getById(operationId);
    final newOperation = entity.copyWith(
      id: 0,
      cloudId: '',
      date: DateTime.now(),
    );

    return insert(newOperation);
  }

  @override
  Future<List<Operation>> getAll() async {
    final operations = await _operationDao.getAllOperations();
    return OperationMapper().listToModel(operations);
  }

  @override
  Future<List<Operation>> getAllWithEmptyCloudId() async {
    final operations =
        await _operationDao.getAllOperationItemsWithEmptyCloudId();
    return OperationMapper().entityListToModel(operations);
  }

  @override
  Future<Operation?> getLast() async {
    final operation = await _operationDao.getLastOperationItem();

    if (operation == null) {
      return null;
    }

    return OperationMapper().entityToModel(operation);
  }

  @override
  Future<Operation> getById(int id) async {
    final operation = await _operationDao.getOperationById(id);
    return OperationMapper().entityToModel(operation);
  }

  @override
  Future<Operation> insert(Operation entity) async {
    final id = await _operationDao.insertOperation(
      entity.map(
        input: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.operationType),
          account: Value(o.account),
          category: Value(o.category),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
        ),
        output: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.operationType),
          account: Value(o.account),
          category: Value(o.category),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
        ),
        transfer: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.operationType),
          account: Value(o.accountSend),
          recAccount: Value(o.accountReceived),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
        ),
        exchange: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.operationType),
          account: Value(o.account),
          sum: Value(o.sumSend.sum),
          recSum: Value(o.sumReceived.sum),
          currencySent: Value(o.sumSend.currency),
          currencyReceived: Value(o.sumReceived.currency),
        ),
      ),
    );

    return entity.copyWith(id: id);
  }

  @override
  Future<void> recover(int operationId) async {
    final entity = await getById(operationId);
    await _operationDao.recoverOperation(OperationMapper().toDBO(entity));
  }

  @override
  Future<void> update(Operation operation) =>
      _operationDao.updateOperation(OperationMapper().toDBO(operation));

  @override
  Stream<List<Operation>> watchAll() => _operationDao
      .watchAllOperationItems()
      .map(OperationMapper().entityListToModel);
}


import 'package:drift/drift.dart';

import '../../domain/interfaces/operation_repository.dart';
import '../../domain/models/operation/operation.dart';
import '../sources/local/data/operation_dao.dart';
import '../sources/local/db_mapper.dart';
import '../sources/local/data/database.dart';

/// Implementation of [OperationRepository] using [OperationDao] and [OperationMapper].
class OperationRepositoryImpl implements OperationRepository {
  final OperationDao _operationDao;

  OperationRepositoryImpl(this._operationDao);

  @override
  Future<void> deleteOperationById(int operationId) =>
      _operationDao.deleteOperationById(operationId);

  @override
  Future<Operation> duplicateOperation(int operationId) async {
    final entity = await getOperationById(operationId);
    final newOperation = entity.copyWith(
      id: 0,
      cloudId: '',
      date: DateTime.now(),
    );

    return insertOperation(newOperation);
  }

  @override
  Future<List<Operation>> getAllOperations() async {
    final operations = await _operationDao.getAllOperations();
    return OperationMapper().listToModel(operations);
  }

  @override
  Future<List<Operation>> getAllOperationsWithEmptyCloudId() async {
    final operations =
        await _operationDao.getAllOperationItemsWithEmptyCloudId();
    return OperationMapper().entityListToModel(operations);
  }

  @override
  Future<Operation?> getLastOperation() async {
    final operation = await _operationDao.getLastOperationItem();

    if (operation == null) {
      return null;
    }

    return OperationMapper().entityToModel(operation);
  }

  @override
  Future<Operation> getOperationById(int id) async {
    final operation = await _operationDao.getOperationById(id);
    return OperationMapper().entityToModel(operation);
  }

  @override
  Future<Operation> insertOperation(Operation entity) async {
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
          account: Value(o.account),
          recAccount: Value(o.recAccount),
          sum: Value(o.sum.sum),
          currencySent: Value(o.sum.currency),
        ),
        exchange: (o) => OperationsCompanion(
          cloudId: Value(o.cloudId),
          date: Value(o.date),
          operationType: Value(o.operationType),
          account: Value(o.account),
          sum: Value(o.sum.sum),
          recSum: Value(o.recSum.sum),
          currencySent: Value(o.sum.currency),
          currencyReceived: Value(o.recSum.currency),
        ),
      ),
    );

    return entity.copyWith(id: id);
  }

  @override
  Future<void> recoverOperation(int operationId) async {
    final entity = await getOperationById(operationId);
    await _operationDao.recoverOperation(OperationMapper().toDBO(entity));
  }

  @override
  Future<void> updateOperation(Operation operation) =>
      _operationDao.updateOperation(OperationMapper().toDBO(operation));

  @override
  Stream<List<Operation>> watchAllOperations() => _operationDao
      .watchAllOperationItems()
      .map(OperationMapper().entityListToModel);
}


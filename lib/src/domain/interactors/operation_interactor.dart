import '../../utils/sum.dart';
import '../interfaces/data_repository.dart';
import '../models.dart';
import '../view_models.dart';

class OperationInteractor {
  final DataRepository _dataRepository;

  OperationInteractor(this._dataRepository);

  Future<Operation> getById(int id) => _dataRepository.getOperationById(id);

  Future<Operation?> getLast() => _dataRepository.getLastOperation();

  Stream<List<OperationView>> watchLast(int count) =>
      _dataRepository.watchLastOperations(count);

  Stream<List<OperationView>> watchByAccountId(int id) =>
      _dataRepository.watchAllOperationsByFilter(OperationListFilter(
        accountIds: {id},
        categoryIds: const {},
      ));

  Stream<List<OperationView>> watchByCategoryId(int id) =>
      _dataRepository.watchAllOperationsByCategory(id);

  Stream<List<OperationView>> watchByFilter(OperationListFilter filter) =>
      _dataRepository.watchAllOperationsByFilter(filter);

  Future<Operation> insertInput({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) {
    final newOperation = InputOperation(
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    return _dataRepository.insertOperation(newOperation);
  }

  Future<Operation> insertOutput({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) {
    final newOperation = OutputOperation(
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    return _dataRepository.insertOperation(newOperation);
  }

  Future<Operation> insertTransfer({
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
    required Sum recSum,
  }) {
    final newOperation = TransferOperation(
      date: date,
      account: accountId,
      recAccount: recAccountId,
      sum: sum,
      recSum: recSum,
    );

    return _dataRepository.insertOperation(newOperation);
  }

  Future<Operation> updateInput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    var newOperation = InputOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    await _dataRepository.updateOperation(newOperation);

    return newOperation;
  }

  Future<Operation> updateOutput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    var newOperation = OutputOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    await _dataRepository.updateOperation(newOperation);

    return newOperation;
  }

  Future<Operation> updateTransfer({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
    required Sum recSum,
  }) async {
    var newOperation = TransferOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      recAccount: recAccountId,
      sum: sum,
      recSum: recSum,
    );

    await _dataRepository.updateOperation(newOperation);

    return newOperation;
  }

  Future delete(Operation operation) =>
      _dataRepository.deleteOperationById(operation.id);

  Future<void> deleteById(int id) => _dataRepository.deleteOperationById(id);

  Future<void> duplicate(int id) => _dataRepository.duplicateOperation(id);

  Future<void> recover(int id) => _dataRepository.recoverOperation(id);
}

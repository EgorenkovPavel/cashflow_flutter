import '../../utils/sum.dart';
import '../interfaces/operation_repository.dart';
import '../models.dart';
import '../services/operation_view_service.dart';
import '../view_models.dart';

class OperationInteractor {
  final OperationRepository _operationRepository;
  final OperationViewService _operationViewService;

  OperationInteractor(
    this._operationRepository,
    this._operationViewService,
  );

  Future<Operation> getById(int id) => _operationRepository.getOperationById(id);

  Future<Operation?> getLast() => _operationRepository.getLastOperation();

  Stream<List<OperationView>> watchLast(int count) =>
      _operationViewService.watchLastOperations(count);

  Stream<List<OperationView>> watchByAccountId(int id) =>
      _operationViewService.watchAllOperationsByAccount(id);

  Stream<List<OperationView>> watchByCategoryId(int id) =>
      _operationViewService.watchAllOperationsByCategory(id);

  Stream<List<OperationView>> watchByFilter(OperationListFilter filter) =>
      _operationViewService.watchAllOperationsByFilter(filter);

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

    return _operationRepository.insertOperation(newOperation);
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

    return _operationRepository.insertOperation(newOperation);
  }

  Future<Operation> insertTransfer({
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
  }) {
    final newOperation = TransferOperation(
      date: date,
      account: accountId,
      recAccount: recAccountId,
      sum: sum,
    );

    return _operationRepository.insertOperation(newOperation);
  }

  Future<Operation> insertExchange({
    required DateTime date,
    required int accountId,
    required Sum sum,
    required Sum recSum,
  }) {
    final newOperation = ExchangeOperation(
      date: date,
      account: accountId,
      sum: sum,
      recSum: recSum,
    );

    return _operationRepository.insertOperation(newOperation);
  }

  Future<Operation> updateInput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    final newOperation = InputOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    await _operationRepository.updateOperation(newOperation);

    return newOperation;
  }

  Future<Operation> updateOutput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    final newOperation = OutputOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    await _operationRepository.updateOperation(newOperation);

    return newOperation;
  }

  Future<Operation> updateTransfer({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
  }) async {
    final newOperation = TransferOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      recAccount: recAccountId,
      sum: sum,
    );

    await _operationRepository.updateOperation(newOperation);

    return newOperation;
  }

  Future<Operation> updateExchange({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required Sum sum,
    required Sum recSum,
  }) async {
    final newOperation = ExchangeOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      sum: sum,
      recSum: recSum,
    );

    await _operationRepository.updateOperation(newOperation);

    return newOperation;
  }

  Future delete(Operation operation) =>
      _operationRepository.deleteOperationById(operation.id);

  Future<void> deleteById(int id) =>
      _operationRepository.deleteOperationById(id);

  Future<void> duplicate(int id) =>
      _operationRepository.duplicateOperation(id);

  Future<void> recover(int id) => _operationRepository.recoverOperation(id);
}

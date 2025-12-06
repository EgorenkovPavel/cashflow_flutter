import '../../utils/sum.dart';
import '../interfaces/operation_repository.dart';
import '../models.dart';
import '../services/operation_view_service.dart';
import '../view_models.dart';

class OperationInteractor {
  final OperationRepository _operationRepository;
  final OperationViewService _operationViewService;

  OperationInteractor(this._operationRepository, this._operationViewService);

  Future<Result<Operation>> getById(int id) async {
    try {
      final operation = await _operationRepository.getOperationById(id);
      return Result.success(operation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation?>> getLast() async {
    try {
      final operation = await _operationRepository.getLastOperation();
      return Result.success(operation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Stream<List<OperationView>> watchLast(int count) =>
      _operationViewService.watchLastOperations(count);

  Stream<List<OperationView>> watchByAccountId(int id) =>
      _operationViewService.watchAllOperationsByAccount(id);

  Stream<List<OperationView>> watchByCategoryId(int id) =>
      _operationViewService.watchAllOperationsByCategory(id);

  Stream<List<OperationView>> watchByFilter(OperationListFilter filter) =>
      _operationViewService.watchAllOperationsByFilter(filter);

  Future<Result<Operation>> insertInput({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    try {
      final newOperation = InputOperation(
        date: date,
        account: accountId,
        category: categoryId,
        sum: sum,
      );

      final operation = await _operationRepository.insertOperation(
        newOperation,
      );
      return Result.success(operation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation>> insertOutput({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    try {
      final newOperation = OutputOperation(
        date: date,
        account: accountId,
        category: categoryId,
        sum: sum,
      );

      final operation = await _operationRepository.insertOperation(
        newOperation,
      );
      return Result.success(operation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation>> insertTransfer({
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
  }) async {
    try {
      final newOperation = TransferOperation(
        date: date,
        account: accountId,
        recAccount: recAccountId,
        sum: sum,
      );

      final operation = await _operationRepository.insertOperation(
        newOperation,
      );
      return Result.success(operation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation>> insertExchange({
    required DateTime date,
    required int accountId,
    required Sum sum,
    required Sum recSum,
  }) async {
    try {
      final newOperation = ExchangeOperation(
        date: date,
        account: accountId,
        sum: sum,
        recSum: recSum,
      );

      final operation = await _operationRepository.insertOperation(
        newOperation,
      );
      return Result.success(operation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation>> updateInput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    try {
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

      return Result.success(newOperation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation>> updateOutput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    try {
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

      return Result.success(newOperation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation>> updateTransfer({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
  }) async {
    try {
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

      return Result.success(newOperation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Operation>> updateExchange({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required Sum sum,
    required Sum recSum,
  }) async {
    try {
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

      return Result.success(newOperation);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future delete(Operation operation) =>
      _operationRepository.deleteOperationById(operation.id);

  Future<void> deleteById(int id) =>
      _operationRepository.deleteOperationById(id);

  Future<void> duplicate(int id) => _operationRepository.duplicateOperation(id);

  Future<void> recover(int id) => _operationRepository.recoverOperation(id);
}

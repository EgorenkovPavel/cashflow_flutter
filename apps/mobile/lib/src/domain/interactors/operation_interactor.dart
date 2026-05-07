import '../../utils/exceptions.dart';
import '../../utils/logger.dart';
import '../interfaces/operation_repository.dart';
import '../models.dart';
import '../services/operation_view_service.dart';

class OperationInteractor {
  final OperationRepository _operationRepository;
  final OperationViewService _operationViewService;

  OperationInteractor(this._operationRepository, this._operationViewService);

  Future<Result<Operation>> getById(int id) async {
    try {
      final operation = await _operationRepository.getById(id);
      return Result.success(operation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to get operation by id: $id', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to get operation', e),
      );
    }
  }

  Future<Result<Operation?>> getLast() async {
    try {
      final operation = await _operationRepository.getLast();
      return Result.success(operation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to get last operation', e, stackTrace);

      return Result.failure(
        DatabaseException('Failed to get last operation', e),
      );
    }
  }

  Stream<List<OperationListItem>> watchLast(int count) =>
      _operationViewService.watchLastOperations(count);

  Stream<List<OperationListItem>> watchByAccountId(int id) =>
      _operationViewService.watchAllOperationsByAccount(id);

  Stream<List<OperationListItem>> watchByCategoryId(int id) =>
      _operationViewService.watchAllOperationsByCategory(id);

  Stream<List<OperationListItem>> watchByFilter(OperationListFilter filter) =>
      _operationViewService.watchAllOperationsByFilter(filter);

  Future<Result<Operation>> insertInput({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Money sum,
  }) async {
    try {
      final newOperation = InputOperation(
        date: date,
        account: accountId,
        category: categoryId,
        sum: sum,
      );

      final operation = await _operationRepository.insert(
        newOperation,
      );
      return Result.success(operation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert input operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to insert operation', e),
      );
    }
  }

  Future<Result<Operation>> insertOutput({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Money sum,
  }) async {
    try {
      final newOperation = OutputOperation(
        date: date,
        account: accountId,
        category: categoryId,
        sum: sum,
      );

      final operation = await _operationRepository.insert(
        newOperation,
      );
      return Result.success(operation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert output operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to insert operation', e),
      );
    }
  }

  Future<Result<Operation>> insertTransfer({
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Money sum,
  }) async {
    try {
      final newOperation = TransferOperation(
        date: date,
        accountSend: accountId,
        accountReceived: recAccountId,
        sum: sum,
      );

      final operation = await _operationRepository.insert(
        newOperation,
      );
      return Result.success(operation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert transfer operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to insert operation', e),
      );
    }
  }

  Future<Result<Operation>> insertExchange({
    required DateTime date,
    required int accountId,
    required Money sum,
    required Money recSum,
  }) async {
    try {
      final newOperation = ExchangeOperation(
        date: date,
        account: accountId,
        sumSend: sum,
        sumReceived: recSum,
      );

      final operation = await _operationRepository.insert(
        newOperation,
      );
      return Result.success(operation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert exchange operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to insert operation', e),
      );
    }
  }

  Future<Result<Operation>> updateInput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Money sum,
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

      await _operationRepository.update(newOperation);

      return Result.success(newOperation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update input operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to update operation', e),
      );
    }
  }

  Future<Result<Operation>> updateOutput({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Money sum,
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

      await _operationRepository.update(newOperation);

      return Result.success(newOperation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update output operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to update operation', e),
      );
    }
  }

  Future<Result<Operation>> updateTransfer({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Money sum,
  }) async {
    try {
      final newOperation = TransferOperation(
        id: operation.id,
        cloudId: operation.cloudId,
        deleted: operation.deleted,
        date: date,
        accountSend: accountId,
        accountReceived: recAccountId,
        sum: sum,
      );

      await _operationRepository.update(newOperation);

      return Result.success(newOperation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update transfer operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to update operation', e),
      );
    }
  }

  Future<Result<Operation>> updateExchange({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required Money sum,
    required Money recSum,
  }) async {
    try {
      final newOperation = ExchangeOperation(
        id: operation.id,
        cloudId: operation.cloudId,
        deleted: operation.deleted,
        date: date,
        account: accountId,
        sumSend: sum,
        sumReceived: recSum,
      );

      await _operationRepository.update(newOperation);

      return Result.success(newOperation);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update exchange operation', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to update operation', e),
      );
    }
  }

  Future delete(Operation operation) =>
      _operationRepository.deleteById(operation.id);

  Future<void> deleteById(int id) =>
      _operationRepository.deleteById(id);

  Future<void> duplicate(int id) => _operationRepository.duplicate(id);

  Future<void> recover(int id) => _operationRepository.recover(id);
}

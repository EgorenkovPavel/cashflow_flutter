import '../models/operation/operation.dart';

/// Repository for managing operations (transactions).
abstract class OperationRepository {
  /// Get all operations.
  Future<List<Operation>> getAllOperations();

  /// Watch all operations as a stream.
  Stream<List<Operation>> watchAllOperations();

  /// Get all operations that don't have a cloud id (not synced).
  Future<List<Operation>> getAllOperationsWithEmptyCloudId();

  /// Get a specific operation by id.
  Future<Operation> getOperationById(int id);

  /// Get the last operation.
  Future<Operation?> getLastOperation();

  /// Insert a new operation and return it with the generated id.
  Future<Operation> insertOperation(Operation entity);

  /// Duplicate an operation by creating a copy with a new id and current date.
  Future<Operation> duplicateOperation(int operationId);

  /// Update an existing operation.
  Future<void> updateOperation(Operation operation);

  /// Recover a deleted operation.
  Future<void> recoverOperation(int operationId);

  /// Delete an operation by id.
  Future<void> deleteOperationById(int operationId);
}


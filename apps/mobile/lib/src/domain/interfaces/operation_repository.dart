import '../models.dart';

abstract interface class OperationRepository {

  Future<List<Operation>> getAll();

  Stream<List<Operation>> watchAll();

  Future<List<Operation>> getAllWithEmptyCloudId();

  Future<Operation> getById(int id);

  Future<Operation?> getLast();

  Future<Operation> insert(Operation entity);

  Future<Operation> duplicate(int operationId);

  Future<void> update(Operation operation);

  Future<void> recover(int operationId);

  Future<void> deleteById(int operationId);
}


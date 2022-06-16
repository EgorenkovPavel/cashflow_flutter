import '../../models.dart';

abstract class OperationDataRepository {
  Future<List<Operation>> getAll();

  Future<List<Operation>> getAllWithEmptyCloudId();

  Stream<List<Operation>> watchAll();

  Stream<List<Operation>> watchAllByFilter(OperationListFilter filter);

  Future<Operation> getById(int id);

  Stream<List<Operation>> watchAllByAccount(int accountId);

  Stream<List<Operation>> watchAllByCategory(int categoryId);

  Stream<List<Operation>> watchLast(int limit);

  Future<Operation?> getLast();

  Future<Operation> insert(Operation entity);

  Future<Operation> duplicate(Operation entity);

  Future<void> update(Operation operation);

  Future<void> delete(Operation entity);

  Future<void> recover(Operation entity);

  Future<void> deleteById(int operationId);

}
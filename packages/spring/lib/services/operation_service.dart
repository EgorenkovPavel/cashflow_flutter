import '../models/models.dart';

abstract interface class OperationService {
  Future<List<Operation>> getAll();

  Future<Operation> createInputOperation(
    DateTime date,
    Account account,
    Category category,
    int sum,
  );

  Future<Operation> createOutputOperation(
    DateTime date,
    Account account,
    Category category,
    int sum,
  );

  Future<Operation> createTransferOperation(
    DateTime date,
    Account account,
    Account accountRec,
    int sum,
    int sumRec,
  );

  Future<Operation> swapToInputOperation(
    OperationId operationId,
    DateTime date,
    Account account,
    Category category,
    int sum,
  );

  Future<Operation> swapToOutputOperation(
    OperationId operationId,
    DateTime date,
    Account account,
    Category category,
    int sum,
  );

  Future<Operation> swapToTransferOperation(
    OperationId operationId,
    DateTime date,
    Account account,
    Account accountRec,
    int sum,
    int sumRec,
  );

  Future<void> deleteOperation(OperationId id);
}

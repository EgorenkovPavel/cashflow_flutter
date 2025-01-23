import '../models/models.dart';

abstract interface class OperationService {

  Future<Operation> getById(OperationId id);

  Future<List<Operation>> getAll();

  Future<InputOperation> createInputOperation(
    DateTime date,
    Account account,
    InputCategoryItem category,
    int sum,
  );

  Future<OutputOperation> createOutputOperation(
    DateTime date,
    Account account,
    OutputCategoryItem category,
    int sum,
  );

  Future<TransferOperation> createTransferOperation(
    DateTime date,
    BaseAccount account,
    BaseAccount accountRec,
    int sum,
    int sumRec,
  );

  Future<InputOperation> swapToInputOperation(
    Operation operation,
    DateTime date,
    Account account,
    InputCategoryItem category,
    int sum,
  );

  Future<OutputOperation> swapToOutputOperation(
    Operation operation,
    DateTime date,
    Account account,
    OutputCategoryItem category,
    int sum,
  );

  Future<TransferOperation> swapToTransferOperation(
    Operation operation,
    DateTime date,
    BaseAccount account,
    BaseAccount accountRec,
    int sum,
    int sumRec,
  );

  Future<void> deleteOperation(OperationId id);
}

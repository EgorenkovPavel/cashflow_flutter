import '../models/models.dart';

abstract interface class OperationService {
  Future<Operation> getById(OperationId id);

  Future<List<Operation>> getAll();

  Future<InputOperation> createInputOperation(
    DateTime date,
    Account account,
    InputCategoryItem category,
    int sum,
    Currency currency,
  );

  Future<OutputOperation> createOutputOperation(
    DateTime date,
    Account account,
    OutputCategoryItem category,
    int sum,
    Currency currency,
  );

  Future<TransferOperation> createTransferOperation(
    DateTime date,
    BaseAccount account,
    BaseAccount accountRec,
    int sum,
    Currency currency,
  );

  Future<ExchangeOperation> createExchangeOperation(
      DateTime date,
      BaseAccount account,
      int sum,
      Currency currency,
      int recSum,
      Currency recCurrency,
);

  Future<InputOperation> swapToInputOperation(
    Operation operation,
    DateTime date,
    Account account,
    InputCategoryItem category,
    int sum,
    Currency currency,
  );

  Future<OutputOperation> swapToOutputOperation(
    Operation operation,
    DateTime date,
    Account account,
    OutputCategoryItem category,
    int sum,
    Currency currency,
  );

  Future<TransferOperation> swapToTransferOperation(
    Operation operation,
    DateTime date,
    BaseAccount account,
    BaseAccount accountRec,
    int sum,
    Currency currency,
  );

  Future<void> deleteOperation(OperationId id);
}

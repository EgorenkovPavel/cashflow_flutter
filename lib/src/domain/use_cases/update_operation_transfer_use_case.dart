import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../models.dart';

class UpdateOperationTransferUseCase {
  final DataRepository _dataRepository;

  UpdateOperationTransferUseCase(this._dataRepository);

  Future<Operation> call({
    required Operation operation,
    required DateTime date,
    required Account account,
    required Account recAccount,
    required int sum,
    required int recSum,
  }) async {
    var newOperation = Operation.transfer(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: account,
      recAccount: recAccount,
      sum: sum,
      recSum: recSum,
    );

    await _dataRepository.operations.update(newOperation);

    return newOperation;
  }
}

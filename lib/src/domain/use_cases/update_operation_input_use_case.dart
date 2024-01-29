import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../models.dart';

class UpdateOperationInputUseCase {
  final DataRepository _dataRepository;

  UpdateOperationInputUseCase(this._dataRepository);

  Future<Operation> call({
    required Operation operation,
    required DateTime date,
    required Account account,
    required Category category,
    required int sum,
  }) async {
    var newOperation = Operation.input(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: account,
      category: category,
      sum: sum,
    );

    await _dataRepository.operations.update(newOperation);

    return newOperation;
  }
}

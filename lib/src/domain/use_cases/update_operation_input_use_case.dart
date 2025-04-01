import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class UpdateOperationInputUseCase {
  final DataRepository _dataRepository;

  UpdateOperationInputUseCase(this._dataRepository);

  Future<Operation> call({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    var newOperation = InputOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    await _dataRepository.updateOperation(newOperation);

    return newOperation;
  }
}

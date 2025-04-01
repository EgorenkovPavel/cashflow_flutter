import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class UpdateOperationOutputUseCase {
  final DataRepository _dataRepository;

  UpdateOperationOutputUseCase(this._dataRepository);

  Future<Operation> call({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) async {
    var newOperation = OutputOperation(
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

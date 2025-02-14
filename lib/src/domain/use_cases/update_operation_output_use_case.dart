import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class UpdateOperationOutputUseCase {
  final DataRepository _dataRepository;

  UpdateOperationOutputUseCase(this._dataRepository);

  Future<Operation> call({
    required Operation operation,
    required DateTime date,
    required Account account,
    required OutputCategoryItem category,
    required Sum sum,
  }) async {
    var newOperation = OutputOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: account,
      category: category,
      sum: sum,
    );

    await _dataRepository.updateOperation(newOperation);

    return newOperation;
  }
}

import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class UpdateOperationTransferUseCase {
  final DataRepository _dataRepository;

  UpdateOperationTransferUseCase(this._dataRepository);

  Future<Operation> call({
    required Operation operation,
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
    required Sum recSum,
  }) async {
    var newOperation = TransferOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: accountId,
      recAccount: recAccountId,
      sum: sum,
      recSum: recSum,
    );

    await _dataRepository.updateOperation(newOperation);

    return newOperation;
  }
}

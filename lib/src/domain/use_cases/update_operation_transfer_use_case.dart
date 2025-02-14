import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class UpdateOperationTransferUseCase {
  final DataRepository _dataRepository;

  UpdateOperationTransferUseCase(this._dataRepository);

  Future<Operation> call({
    required Operation operation,
    required DateTime date,
    required BaseAccount account,
    required BaseAccount recAccount,
    required Sum sum,
    required Sum recSum,
  }) async {
    var newOperation = TransferOperation(
      id: operation.id,
      cloudId: operation.cloudId,
      deleted: operation.deleted,
      date: date,
      account: account,
      recAccount: recAccount,
      sum: sum,
      recSum: recSum,
    );

    await _dataRepository.updateOperation(newOperation);

    return newOperation;
  }
}

import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class InsertOperationTransferUseCase {
  final DataRepository _dataRepository;

  InsertOperationTransferUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required int accountId,
    required int recAccountId,
    required Sum sum,
    required Sum recSum,
  }) {
    final newOperation = TransferOperation(
      date: date,
      account: accountId,
      recAccount: recAccountId,
      sum: sum,
      recSum: recSum,
    );

    return _dataRepository.insertOperation(newOperation);
  }
}

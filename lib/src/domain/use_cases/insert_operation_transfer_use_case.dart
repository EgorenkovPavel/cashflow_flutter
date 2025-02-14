import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class InsertOperationTransferUseCase {
  final DataRepository _dataRepository;

  InsertOperationTransferUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required BaseAccount account,
    required BaseAccount recAccount,
    required Sum sum,
    required Sum recSum,
  }) {
    final newOperation = TransferOperation(
      date: date,
      account: account,
      recAccount: recAccount,
      sum: sum,
      recSum: recSum,
    );

    return _dataRepository.insertOperation(newOperation);
  }
}

import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../models.dart';

class InsertOperationTransferUseCase{
  final DataRepository _dataRepository;

  InsertOperationTransferUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required Account account,
    required Account recAccount,
    required int sum,
    required int recSum,
}){
    final newOperation = Operation.transfer(
      date: date,
      account: account,
      recAccount: recAccount,
      sum: sum,
      recSum: recSum,
    );

    return _dataRepository.operations.insert(newOperation);
  }
}
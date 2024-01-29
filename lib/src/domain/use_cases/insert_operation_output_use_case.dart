import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../models.dart';
import '../models/operation/operation.dart';

class InsertOperationOutputUseCase{
  final DataRepository _dataRepository;

  InsertOperationOutputUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required Account account,
    required Category category,
    required int sum,
  }){
    final newOperation = Operation.output(
      date: date,
      account: account,
      category: category,
      sum: sum,
    );

    return _dataRepository.operations.insert(newOperation);
  }
}
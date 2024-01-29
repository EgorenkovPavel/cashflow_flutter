import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../models.dart';

class InsertOperationInputUseCase {
  final DataRepository _dataRepository;

  InsertOperationInputUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required Account account,
    required Category category,
    required int sum,
  }) {
    final newOperation = InputOperation(
      date: date,
      account: account,
      category: category,
      sum: sum,
    );

    return _dataRepository.operations.insert(newOperation);
  }
}

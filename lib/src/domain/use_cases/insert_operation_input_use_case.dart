import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class InsertOperationInputUseCase {
  final DataRepository _dataRepository;

  InsertOperationInputUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }) {
    final newOperation = InputOperation(
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    return _dataRepository.insertOperation(newOperation);
  }
}

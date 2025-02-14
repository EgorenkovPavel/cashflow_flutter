import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class InsertOperationInputUseCase {
  final DataRepository _dataRepository;

  InsertOperationInputUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required Account account,
    required InputCategoryItem category,
    required Sum sum,
  }) {
    final newOperation = InputOperation(
      date: date,
      account: account,
      category: category,
      sum: sum,
    );

    return _dataRepository.insertOperation(newOperation);
  }
}

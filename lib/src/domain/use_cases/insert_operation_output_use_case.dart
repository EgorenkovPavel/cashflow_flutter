import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../../utils/sum.dart';
import '../models.dart';

class InsertOperationOutputUseCase{
  final DataRepository _dataRepository;

  InsertOperationOutputUseCase(this._dataRepository);

  Future<Operation> call({
    required DateTime date,
    required int accountId,
    required int categoryId,
    required Sum sum,
  }){
    final newOperation = OutputOperation(
      date: date,
      account: accountId,
      category: categoryId,
      sum: sum,
    );

    return _dataRepository.insertOperation(newOperation);
  }
}
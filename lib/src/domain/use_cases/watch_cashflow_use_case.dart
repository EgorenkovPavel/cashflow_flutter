import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class WatchCashflowUseCase{
  final DataRepository _dataRepository;

  WatchCashflowUseCase(this._dataRepository);

  Stream<List<CategoryCashflow>> call() => _dataRepository.watchCashflow(DateTime.now());
}
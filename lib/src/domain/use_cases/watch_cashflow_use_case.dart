import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class WatchCashflowUseCase{
  final DataRepository _dataRepository;

  WatchCashflowUseCase(this._dataRepository);

  Stream<List<CategoryCashFlow>> call() => _dataRepository.watchCashFlow(DateTime.now());
}
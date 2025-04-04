import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class WatchBalancesUseCase{
  final DataRepository _dataRepository;

  WatchBalancesUseCase(this._dataRepository);

  Stream<List<BaseAccountBalanceListItem>> call() => _dataRepository.watchAllBalance();
}
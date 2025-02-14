import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models/account/account_balance.dart';

class WatchBalancesUseCase{
  final DataRepository _dataRepository;

  WatchBalancesUseCase(this._dataRepository);

  Stream<List<BaseAccountBalance>> call() => _dataRepository.watchAllBalance();
}
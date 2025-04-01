import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class WatchOperationsByAccountUseCase {
  final DataRepository _dataRepository;

  WatchOperationsByAccountUseCase(this._dataRepository);

  //TODO refactoring
  Stream<List<OperationListItem>> call({required int accountId}) =>
      _dataRepository.watchAllOperationsByFilter(OperationListFilter(
        accountIds: {accountId},
        categoryIds: const {},
      ));
}

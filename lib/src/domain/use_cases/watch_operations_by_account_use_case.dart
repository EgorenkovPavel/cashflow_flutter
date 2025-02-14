import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class WatchOperationsByAccountUseCase {
  final DataRepository _dataRepository;

  WatchOperationsByAccountUseCase(this._dataRepository);

  //TODO refactoring
  Stream<List<Operation>> call({required int accountId}) =>
      _dataRepository.watchAllOperationsByFilter(OperationListFilter(
        accounts: {
          Account(
            id: accountId,
            title: '',
            user: const User(photo: '', name: '', googleId: ''),
          ),
        },
        categories: const {},
      ));
}

import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import '../models.dart';
import '../models/enum/currency.dart';

class WatchOperationsByAccountUseCase {
  final DataRepository _dataRepository;

  WatchOperationsByAccountUseCase(this._dataRepository);

  //TODO refactoring
  Stream<List<Operation>> call({required int accountId}) =>
      _dataRepository.operations.watchAllByFilter(OperationListFilter(
        accounts: {
          Account(
            id: accountId,
            title: '',
            isDebt: false,
            currency: Currency.RUB,
          ),
        },
        categories: const {},
      ));
}

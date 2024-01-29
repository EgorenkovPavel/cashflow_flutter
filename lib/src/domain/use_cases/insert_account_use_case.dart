import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';
import '../models.dart';

class InsertAccountUseCase {
  final DataRepository _dataRepository;

  InsertAccountUseCase(this._dataRepository);

  Future<Account> call({
    required String title,
    required bool isDebt,
    required Currency currency,
  }) async {
    final account = Account(
      title: title,
      isDebt: isDebt,
      currency: currency,
    );
    final id = await _dataRepository.accounts.insert(account);

    return account.copyWith(id: id);
  }
}

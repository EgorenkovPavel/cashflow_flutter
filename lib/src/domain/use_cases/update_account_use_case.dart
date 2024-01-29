import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';
import '../models.dart';

class UpdateAccountUseCase {
  final DataRepository _dataRepository;

  UpdateAccountUseCase(this._dataRepository);

  Future<Account> call({
    required Account account,
    required String title,
    required bool isDebt,
    required Currency currency,
  }) async {
    final newAccount = account.copyWith(
      title: title,
      isDebt: isDebt,
      currency: currency,
    );
    await _dataRepository.accounts.update(newAccount);

    return newAccount;
  }
}

import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class UpdateAccountUseCase {
  final DataRepository _dataRepository;

  UpdateAccountUseCase(this._dataRepository);

  Future<BaseAccount> call({
    required BaseAccount account,
    required String title,
    required int? userId,
  }) async {
    switch (account) {
      case Account():
        final newAccount = account.copyWith(title: title).setUser(userId);
        await _dataRepository.updateAccount(newAccount);

        return newAccount;
      case Debt():
        final newAccount = account.copyWith(title: title).setUser(userId);
        await _dataRepository.updateAccount(newAccount);

        return newAccount;
    }
  }
}

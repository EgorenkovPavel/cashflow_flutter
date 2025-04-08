import '../interfaces/data_repository.dart';
import '../models.dart';
import '../view_models.dart';

class AccountInteractor {
  final DataRepository _dataRepository;

  AccountInteractor(this._dataRepository);

  Future<BaseAccount> getById(int id) => _dataRepository.getAccountById(id);

  Stream<BaseAccount> watchById(int id) => _dataRepository.watchAccountById(id);

  Stream<List<AccountBalanceView>> watchBalances() => _dataRepository.watchAllBalance();

  Future<BaseAccount> insert({
    required String title,
    required bool isDebt,
    required int? userId,
  }) async {
    if (isDebt) {
      final account = Debt(
        title: title,
        userId: userId,
      );
      final id = await _dataRepository.insertAccount(account);

      return account.copyWith(id: id);
    } else {
      final account = Account(
        title: title,
        userId: userId,
      );
      final id = await _dataRepository.insertAccount(account);

      return account.copyWith(id: id);
    }
  }

  Future<BaseAccount> update({
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

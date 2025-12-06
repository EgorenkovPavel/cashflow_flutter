import '../interfaces/account_repository.dart';
import '../models.dart';
import '../services/balance_service.dart';
import '../view_models.dart';

class AccountInteractor {
  final AccountRepository _accountRepository;
  final BalanceService _balanceService;

  AccountInteractor(
    this._accountRepository,
    this._balanceService,
  );

  Future<BaseAccount> getById(int id) => _accountRepository.getAccountById(id);

  Stream<BaseAccount> watchById(int id) =>
      _accountRepository.watchAccountById(id);

  Stream<List<AccountBalanceView>> watchBalances() =>
      _balanceService.watchAllBalance();

  Future<BaseAccount> insert({
    required String title,
    required bool isDebt,
    required int? userId,
  }) async {
    final account = switch (isDebt) {
      true => Debt(title: title, userId: userId),
      false => Account(title: title, userId: userId),
    };

    final id = await _accountRepository.insertAccount(account);

    return account.copyWith(id: id);
  }

  Future<BaseAccount> update({
    required BaseAccount account,
    required String title,
    required int? userId,
  }) async {
    final newAccount = account.copyWith(title: title).setUser(userId);
    await _accountRepository.updateAccount(newAccount);
    return newAccount;
  }
}

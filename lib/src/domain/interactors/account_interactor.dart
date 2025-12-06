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

  Future<Result<BaseAccount>> getById(int id) async {
    try {
      final account = await _accountRepository.getAccountById(id);
      return Result.success(account);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Stream<BaseAccount> watchById(int id) =>
      _accountRepository.watchAccountById(id);

  Stream<List<AccountBalanceView>> watchBalances() =>
      _balanceService.watchAllBalance();

  Future<Result<BaseAccount>> insert({
    required String title,
    required bool isDebt,
    required int? userId,
  }) async {
    try {
      final account = switch (isDebt) {
        true => Debt(title: title, userId: userId),
        false => Account(title: title, userId: userId),
      };
      final id = await _accountRepository.insertAccount(account);
      return Result.success(account.copyWith(id: id));
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<BaseAccount>> update({
    required BaseAccount account,
    required String title,
    required int? userId,
  }) async {
    try {
      final newAccount = account.copyWith(title: title).setUser(userId);
      await _accountRepository.updateAccount(newAccount);
      return Result.success(newAccount);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }
}
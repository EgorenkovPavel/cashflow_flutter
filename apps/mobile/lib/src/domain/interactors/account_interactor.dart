import '../../utils/exceptions.dart';
import '../../utils/logger.dart';
import '../../utils/result.dart';
import '../interfaces/account_repository.dart';
import '../models.dart';
import '../services/balance_service.dart';

class AccountInteractor {
  final AccountRepository _accountRepository;
  final BalanceService _balanceService;

  AccountInteractor(this._accountRepository, this._balanceService);

  Future<Result<BaseAccount>> getById(int id) async {
    try {
      final account = await _accountRepository.getById(id);

      return Result.success(account);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to get account by id: $id', e, stackTrace);

      return Result.failure(DatabaseException('Failed to get account', e));
    }
  }

  Stream<BaseAccount> watchById(int id) =>
      _accountRepository.watchById(id);

  Stream<List<AccountBalanceItem>> watchBalances() =>
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
      final id = await _accountRepository.insert(account);

      return Result.success(account.copyWith(id: id));
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert account', e, stackTrace);

      return Result.failure(DatabaseException('Failed to insert account', e));
    }
  }

  Future<Result<BaseAccount>> update({
    required BaseAccount account,
    required String title,
    required int? userId,
  }) async {
    try {
      final newAccount = account.copyWith(title: title, userId: userId);
      await _accountRepository.update(newAccount);

      return Result.success(newAccount);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update account', e, stackTrace);

      return Result.failure(DatabaseException('Failed to update account', e));
    }
  }
}

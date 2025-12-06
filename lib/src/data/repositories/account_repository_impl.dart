
import 'package:drift/drift.dart';

import '../../domain/interfaces/account_repository.dart';
import '../sources/local/data/account_dao.dart';
import 'package:money_tracker/src/domain/models.dart';

import '../sources/local/data/database.dart';
import '../sources/local/db_mapper.dart';

/// Implementation of [AccountRepository] using [AccountDao] and [AccountMapper].
class AccountRepositoryImpl implements AccountRepository {
  final AccountDao _accountDao;

  AccountRepositoryImpl(this._accountDao);

  @override
  Future<BaseAccount> getAccountById(int id) async {
    final account = await _accountDao.getAccountById(id);
    return AccountMapper().toModel(account);
}

  @override
  Future<List<BaseAccount>> getAllAccounts() async {
    final accounts = await _accountDao.getAllAccounts();
    return AccountMapper().listToModel(accounts);
  }

  @override
  Future<int> insertAccount(BaseAccount account) =>
      _accountDao.insertAccount(AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account is Debt),
        user: Value(account.userId),
      ));

  @override
  Future<void> updateAccount(BaseAccount account) =>
      _accountDao.updateAccount(AccountMapper().toDBO(account));

  @override
  Stream<BaseAccount> watchAccountById(int id) {
    return _accountDao.watchAccountById(id).map(AccountMapper().toModel);
  }

  @override
  Stream<List<BaseAccount>> watchAllAccounts() =>
      _accountDao.watchAllAccounts().map(AccountMapper().listToModel);
}


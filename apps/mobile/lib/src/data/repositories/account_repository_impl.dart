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
  Future<BaseAccount> getById(int id) async {
    final account = await _accountDao.getAccountById(id);

    return AccountMapper().toModel(account);
  }

  @override
  Future<List<BaseAccount>> getAll() async {
    final accounts = await _accountDao.getAllAccounts();

    return AccountMapper().listToModel(accounts);
  }

  @override
  Future<int> insert(BaseAccount account) => _accountDao.insertAccount(
    AccountsCompanion(
      cloudId: Value(account.cloudId),
      title: Value(account.title),
      isDebt: Value(account is Debt),
      user: Value(account.userId),
    ),
  );

  @override
  Future<void> update(BaseAccount account) =>
      _accountDao.updateAccount(AccountMapper().toDBO(account));

  @override
  Stream<BaseAccount> watchById(int id) =>
      _accountDao.watchAccountById(id).map(AccountMapper().toModel);

  @override
  Stream<List<BaseAccount>> watchAll() =>
      _accountDao.watchAllAccounts().map(AccountMapper().listToModel);
}

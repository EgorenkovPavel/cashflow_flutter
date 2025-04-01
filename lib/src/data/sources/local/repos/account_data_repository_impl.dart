import 'package:drift/drift.dart';
import 'package:money_tracker/src/data/sources/local/data/user_dao.dart';

import '../../../../domain/models.dart';
import '../../../interfaces/local_sync_source.dart';

import '../data/account_dao.dart';
import '../data/database.dart';
import '../db_mapper.dart';

class AccountDataRepositoryImpl
    implements LocalSyncTable<BaseAccount> {
  final AccountDao accountDao;
  final UserDao userDao;

  AccountDataRepositoryImpl(this.accountDao, this.userDao);

  @override
  Future<List<BaseAccount>> getAllWithEmptyCloudId() async {
    final accounts = await accountDao.getAllAccountsWithEmptyCloudId();
    return AccountMapper().listToModel(accounts);
  }

  @override
  Future<BaseAccount?> getByCloudId(String cloudId) async {
    final account = await accountDao.getAccountByCloudId(cloudId);
    return account == null ? null : AccountMapper().toModel(account);
  }

  @override
  Future<List<BaseAccount>> getAllNotSynced() async {
    final accounts = await accountDao.getAllAccountsNotSynced();
    return AccountMapper().listToModel(accounts);
  }

  @override
  Future markAsSynced(int accountId, String cloudId) {
    return accountDao.markAsSynced(accountId, cloudId);
  }

  @override
  Future insertFromCloud(BaseAccount account) {
    return accountDao.insertAccount(AccountsCompanion(
      cloudId: Value(account.cloudId),
      title: Value(account.title),
      isDebt: Value(account is Debt),
      synced: const Value(true),
      user: Value(account.userId),
    ));
  }

  @override
  Future updateFromCloud(BaseAccount account) {
    return accountDao.updateFields(
      account.id,
      AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account is Debt),
        synced: const Value(true),
        user: Value(account.userId),
      ),
    );
  }
}

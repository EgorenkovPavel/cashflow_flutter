import 'package:drift/drift.dart';
import 'package:money_tracker/src/data/sources/local/data/user_dao.dart';

import '../../../../domain/models.dart';
import '../../../interfaces/local_sync_source.dart';
import '../data/account_dao.dart';
import '../data/database.dart';
import '../mapper_db.dart';

class AccountDataRepositoryImpl
    implements LocalSyncTable<Account> {
  final AccountDao accountDao;
  final UserDao userDao;

  AccountDataRepositoryImpl(this.accountDao, this.userDao);

  @override
  Future<List<Account>> getAllWithEmptyCloudId() async {
    final accounts = await accountDao.getAllAccountsWithEmptyCloudId();
    final users = await userDao.getAllUsers();
    return MapperDB.combineUsers(accounts, users);
  }

  @override
  Future<Account?> getByCloudId(String cloudId) async {
    final account = await accountDao.getAccountByCloudId(cloudId);

    if (account == null){
      return null;
    }
    final userId = account.user;
    if (userId == null){
      return MapperDB.createAccount(account, null);
    }else{
      final user = await userDao.getById(userId);
      return MapperDB.createAccount(account, user);
    }
  }

  @override
  Future<List<Account>> getAllNotSynced() async {
    final accounts = await accountDao.getAllAccountsNotSynced();
    final users = await userDao.getAllUsers();
    return MapperDB.combineUsers(accounts, users);
  }

  @override
  Future markAsSynced(int accountId, String cloudId) {
    return accountDao.markAsSynced(accountId, cloudId);
  }

  @override
  Future insertFromCloud(Account account) {
    return accountDao.insertAccount(AccountsCompanion(
      cloudId: Value(account.cloudId),
      title: Value(account.title),
      isDebt: Value(account.isDebt),
      synced: const Value(true),
    ));
  }

  @override
  Future updateFromCloud(Account account) {
    return accountDao.updateFields(
      account.id,
      AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account.isDebt),
        synced: const Value(true),
      ),
    );
  }
}

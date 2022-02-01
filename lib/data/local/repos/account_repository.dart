import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/data/local/data/account_dao.dart';
import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/mappers/account_balance_mapper.dart';
import 'package:money_tracker/data/mappers/account_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:drift/drift.dart';

class AccountRepository implements LocalSyncTable<Account>, AccountDataSource{
  final AccountDao accountDao;

  AccountRepository(this.accountDao);

  final List<Account> Function(List<AccountDB>) _mapAccountList =
      (list) => const AccountMapper().mapListToDart(list);

  final Account Function(AccountDB) _mapAccount =
      (item) => const AccountMapper().mapToDart(item);

  final AccountDB Function(Account) _mapAccountDB =
      (item) => const AccountMapper().mapToSql(item);

  final List<AccountBalance> Function(List<AccountBalanceEntity>)
      _mapAccountBalanceList =
      (list) => const AccountBalanceMapper().mapListToDart(list);

  @override
  Stream<List<Account>> watchAll() =>
      accountDao.watchAllAccounts().map(_mapAccountList);

  @override
  Future<List<Account>> getAll() async =>
      _mapAccountList(await accountDao.getAllAccounts());

  @override
  Future<List<Account>> getAllWithEmptyCloudId() async =>
      _mapAccountList(await accountDao.getAllAccountsWithEmptyCloudId());

  @override
  Stream<List<AccountBalance>> watchAllBalance() =>
      accountDao.watchAllAccountsWithBalance().map(_mapAccountBalanceList);

  @override
  Future<List<AccountBalance>> getAllBalance() async =>
      _mapAccountBalanceList(await accountDao.getAllAccountsBalance());

  @override
  Stream<Account> watchById(int id) =>
      accountDao.watchAccountById(id).map(_mapAccount);

  @override
  Future<Account> getById(int id) async =>
      _mapAccount(await accountDao.getAccountById(id));

  @override
  Future<Account?> getByCloudId(String cloudId) async {
    var _account = await accountDao.getAccountByCloudId(cloudId);
    if (_account == null){
      return null;
    }else{
      return _mapAccount(_account);
    }
  }


  @override
  Future<int> insert(Account account) =>
      accountDao.insertAccount(AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account.isDebt),
      ));

  @override
  Future update(Account account) =>
      accountDao.updateAccount(_mapAccountDB(account));

  @override
  Future<List<Account>> getAllNotSynced() async {
    return _mapAccountList(await accountDao.getAllAccountsNotSynced());
  }

  @override
  Future markAsSynced(int accountId, String cloudId) {
    return accountDao.markAsSynced(accountId, cloudId);
  }

  @override
  Stream<Account> watchNotSynced() {
    return accountDao.watchNotSynced().map((event) => _mapAccount(event));
  }

  @override
  Future insertFromCloud(Account account) {
    return accountDao.insertAccount(AccountsCompanion(
      cloudId: Value(account.cloudId),
      title: Value(account.title),
      isDebt: Value(account.isDebt),
      synced: Value(true),
    ));
  }

  @override
  Future updateFromCloud(Account account) {
    return accountDao.updateFields(account.id, AccountsCompanion(
      cloudId: Value(account.cloudId),
      title: Value(account.title),
      isDebt: Value(account.isDebt),
      synced: Value(true),
    ));
  }
}

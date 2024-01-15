import 'package:drift/drift.dart';
import '../../../../domain/interfaces/data/account_data_repository.dart';
import '../data/account_dao.dart';
import '../data/database.dart';
import '../entities/account_balance_entity.dart';
import '../../../interfaces/local_sync_source.dart';
import '../mappers/account_balance_mapper.dart';
import '../mappers/account_mapper.dart';
import '../../../../domain/models.dart';

class AccountDataRepositoryImpl
    implements LocalSyncTable<Account>, AccountDataRepository {
  final AccountDao accountDao;

  AccountDataRepositoryImpl(this.accountDao);

  List<Account> _mapAccountList(List<AccountDB> list) =>
      const AccountMapper().mapListToDart(list);

  Account _mapAccount(AccountDB item) => const AccountMapper().mapToDart(item);

  AccountDB _mapAccountDB(Account item) => const AccountMapper().mapToSql(item);

  List<AccountBalance> _mapAccountBalanceList(
    List<AccountBalanceEntity> list,
  ) =>
      const AccountBalanceMapper().mapListToDart(list);

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
    var account = await accountDao.getAccountByCloudId(cloudId);

    return account == null ? null : _mapAccount(account);
  }

  @override
  Future<int> insert(Account account) =>
      accountDao.insertAccount(AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account.isDebt),
        currency: Value(account.currency),
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
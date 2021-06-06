import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/account_balance_mapper.dart';
import 'package:money_tracker/data/mappers/account_mapper.dart';
import 'package:money_tracker/domain/models.dart';

class AccountRepository {
  final Database db;

  AccountRepository(this.db);

  final List<Account> Function(List<AccountDB>) _mapAccountList =
      (list) => const AccountMapper().mapListToDart(list);

  final Account Function(AccountDB) _mapAccount =
      (item) => const AccountMapper().mapToDart(item);

  final AccountDB Function(Account) _mapAccountDB =
      (item) => const AccountMapper().mapToSql(item);

  final List<AccountBalance> Function(List<AccountBalanceEntity>)
      _mapAccountBalanceList =
      (list) => const AccountBalanceMapper().mapListToDart(list);

  Stream<List<Account>> watchAll() =>
      db.accountDao.watchAllAccounts().map(_mapAccountList);

  Future<List<Account>> getAll() async =>
      _mapAccountList(await db.accountDao.getAllAccounts());

  Stream<List<AccountBalance>> watchAllBalance() =>
      db.accountDao.watchAllAccountsWithBalance().map(_mapAccountBalanceList);

  Future<List<AccountBalance>> getAllBalance() async =>
      _mapAccountBalanceList(await db.accountDao.getAllAccountsBalance());

  Stream<Account> watchById(int id) =>
      db.accountDao.watchAccountById(id).map(_mapAccount);

  Future<Account> getById(int id) async =>
      _mapAccount(await db.accountDao.getAccountById(id));

  Future<int> insert(Account account) =>
      db.accountDao.insertAccount(_mapAccountDB(account));

  Future update(Account account) =>
      db.accountDao.updateAccount(_mapAccountDB(account));
}

import 'package:money_tracker/data/database/account_dao.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/account_balance_mapper.dart';
import 'package:money_tracker/data/mappers/account_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:moor/moor.dart';

class AccountRepository {
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

  Stream<List<Account>> watchAll() =>
      accountDao.watchAllAccounts().map(_mapAccountList);

  Future<List<Account>> getAll() async =>
      _mapAccountList(await accountDao.getAllAccounts());

  Stream<List<AccountBalance>> watchAllBalance() =>
      accountDao.watchAllAccountsWithBalance().map(_mapAccountBalanceList);

  Future<List<AccountBalance>> getAllBalance() async =>
      _mapAccountBalanceList(await accountDao.getAllAccountsBalance());

  Stream<Account> watchById(int id) =>
      accountDao.watchAccountById(id).map(_mapAccount);

  Future<Account> getById(int id) async =>
      _mapAccount(await accountDao.getAccountById(id));

  Future<Account?> getByCloudId(String cloudId) async {
    var _account = await accountDao.getAccountByCloudId(cloudId);
    if (_account == null){
      return null;
    }else{
      return _mapAccount(_account);
    }
  }


  Future<int> insert(Account account) =>
      accountDao.insertAccount(AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account.isDebt),
      ));

  Future update(Account account) =>
      accountDao.updateAccount(_mapAccountDB(account));
}

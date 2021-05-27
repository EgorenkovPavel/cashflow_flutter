import 'package:cashflow/data/database/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/account_balance.dart';

class AccountBalanceMapper extends Mapper<AccountBalance, AccountBalanceEntity>{
  const AccountBalanceMapper();

  @override
  AccountBalanceEntity mapToSql(AccountBalance a) {
    return AccountBalanceEntity(
        AccountDB(id: a.id, title: a.title, ), a.balance);
  }

  @override
  AccountBalance mapToDart(AccountBalanceEntity a) {
    return AccountBalance(
        id: a.account.id,
        title: a.account.title,
        balance: a.sum);
  }

  Account mapToAccount(AccountBalance a) {
    return Account(
        id: a.id,
        title: a.title,);
  }
}

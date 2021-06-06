
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/domain/models/account.dart';
import 'package:money_tracker/domain/models/account_balance.dart';

import 'mapper.dart';

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

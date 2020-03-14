import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/account_balance.dart';

class AccountBalanceMapper extends Mapper<AccountBalance, AccountBalanceEntity>{
  const AccountBalanceMapper();

  AccountBalanceEntity mapToSql(AccountBalance a) {
    return AccountBalanceEntity(
        AccountData(id: a.id, title: a.title, archive: a.archive), a.balance);
  }

  AccountBalance mapToDart(AccountBalanceEntity a) {
    return AccountBalance(
        id: a.account.id,
        title: a.account.title,
        archive: a.account.archive,
        balance: a.sum);
  }
}

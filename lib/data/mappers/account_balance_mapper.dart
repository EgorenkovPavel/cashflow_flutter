import 'package:money_tracker/data/database/account_dao.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/domain/models.dart';

import 'mapper.dart';

class AccountBalanceMapper
    extends Mapper<AccountBalance, AccountBalanceEntity> {
  const AccountBalanceMapper();

  @override
  AccountBalanceEntity mapToSql(AccountBalance a) {
    return AccountBalanceEntity(
        AccountDB(
          id: a.id,
          title: a.title,
          isDebt: a.isDebt,
        ),
        a.balance);
  }

  @override
  AccountBalance mapToDart(AccountBalanceEntity a) {
    return AccountBalance(
        id: a.account.id,
        title: a.account.title,
        isDebt: a.account.isDebt,
        balance: a.sum);
  }

  Account mapToAccount(AccountBalance a) {
    return Account(
      id: a.id,
      title: a.title,
      isDebt: a.isDebt,
    );
  }
}

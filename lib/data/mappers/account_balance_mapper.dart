// ignore_for_file: avoid_renaming_method_parameters

import 'package:money_tracker/data/local/data/account_dao.dart';
import 'package:money_tracker/data/local/data/database.dart';
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
          cloudId: a.cloudId,
          title: a.title,
          isDebt: a.isDebt,
          synced: false,
        ),
        a.balance);
  }

  @override
  AccountBalance mapToDart(AccountBalanceEntity a) {
    return AccountBalance(
        id: a.account.id,
        cloudId: a.account.cloudId,
        title: a.account.title,
        isDebt: a.account.isDebt,
        balance: a.sum);
  }

  Account mapToAccount(AccountBalance a) {
    return Account(
      id: a.id,
      cloudId: a.cloudId,
      title: a.title,
      isDebt: a.isDebt,
    );
  }
}

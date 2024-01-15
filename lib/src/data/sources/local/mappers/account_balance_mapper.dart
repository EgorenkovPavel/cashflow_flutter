// ignore_for_file: avoid_renaming_method_parameters

import 'package:money_tracker/src/data/sources/local/data/database.dart';
import 'package:money_tracker/src/data/sources/local/entities/account_balance_entity.dart';
import 'package:money_tracker/src/domain/models.dart';

import 'mapper.dart';

class AccountBalanceMapper
    extends Mapper<AccountBalance, AccountBalanceEntity> {
  const AccountBalanceMapper();

  @override
  AccountBalanceEntity mapToSql(AccountBalance a) {
    return AccountBalanceEntity(
      account: AccountDB(
        id: a.id,
        cloudId: a.cloudId,
        title: a.title,
        isDebt: a.isDebt,
        currency: a.currency,
        synced: false,
      ),
      sum: a.balance,
    );
  }

  @override
  AccountBalance mapToDart(AccountBalanceEntity a) {
    return AccountBalance(
      id: a.account.id,
      cloudId: a.account.cloudId,
      title: a.account.title,
      isDebt: a.account.isDebt,
      currency: a.account.currency,
      balance: a.sum,
    );
  }
}
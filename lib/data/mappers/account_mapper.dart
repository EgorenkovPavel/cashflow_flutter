import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/domain/models.dart';

import 'mapper.dart';

class AccountMapper extends Mapper<Account, AccountDB> {
  const AccountMapper();

  @override
  AccountDB mapToSql(Account a) {
    return AccountDB(
      id: a.id,
      cloudId: a.cloudId,
      title: a.title,
      isDebt: a.isDebt,
      synced: false,
    );
  }

  @override
  Account mapToDart(AccountDB a) {
    return Account(
      id: a.id,
      cloudId: a.cloudId,
      title: a.title,
      isDebt: a.isDebt,
    );
  }
}

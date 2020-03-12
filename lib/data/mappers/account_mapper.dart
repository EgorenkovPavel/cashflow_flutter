import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/objects/account.dart';

class AccountMapper{
  const AccountMapper();

  AccountData mapToSql(Account a){
    return AccountData(id: a.id, title: a.title, archive: a.archive);
  }

  Account mapToDart(AccountData a){
    return Account(id: a.id, title: a.title, archive: a.archive);
  }
}
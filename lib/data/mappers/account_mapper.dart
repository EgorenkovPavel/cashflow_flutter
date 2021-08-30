
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/domain/models.dart';

import 'mapper.dart';

class AccountMapper extends Mapper<Account, AccountDB>{
  const AccountMapper();

  @override
  AccountDB mapToSql(Account a){
    return AccountDB(id: a.id, title: a.title, isDebt: a.isDebt, );
  }

  @override
  Account mapToDart(AccountDB a){
    return Account(id: a.id, title: a.title, isDebt: a.isDebt);
  }
}
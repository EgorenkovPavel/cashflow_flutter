import 'package:cashflow/data/database/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/account.dart';

class AccountMapper extends Mapper<Account, AccountDB>{
  const AccountMapper();

  @override
  AccountDB mapToSql(Account a){
    return AccountDB(id: a.id, title: a.title, );
  }

  @override
  Account mapToDart(AccountDB a){
    return Account(id: a.id, title: a.title, );
  }
}
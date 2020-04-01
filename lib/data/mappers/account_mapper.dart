import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/account.dart';

class AccountMapper extends Mapper<Account, AccountEntityData>{
  const AccountMapper();

  AccountEntityData mapToSql(Account a){
    return AccountEntityData(id: a.id, title: a.title, archive: a.archive);
  }

  Account mapToDart(AccountEntityData a){
    return Account(id: a.id, title: a.title, archive: a.archive);
  }
}
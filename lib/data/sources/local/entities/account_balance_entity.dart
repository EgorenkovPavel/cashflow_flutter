import 'package:money_tracker/data/sources/local/data/database.dart';

class AccountBalanceEntity {
  AccountDB account;
  int sum;

  AccountBalanceEntity(this.account, this.sum);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AccountBalanceEntity &&
              runtimeType == other.runtimeType &&
              account == other.account;

  @override
  int get hashCode => account.hashCode;
}

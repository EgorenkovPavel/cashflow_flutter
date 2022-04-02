import 'package:equatable/equatable.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';

class AccountBalanceEntity extends Equatable{
  AccountDB account;
  int sum;

  AccountBalanceEntity(this.account, this.sum);

  @override
  List<Object?> get props => [account, sum];
}

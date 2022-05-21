import 'package:equatable/equatable.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';

class AccountBalanceEntity extends Equatable{
  final AccountDB account;
  final int sum;

  const AccountBalanceEntity(this.account, this.sum);

  @override
  List<Object?> get props => [account, sum];
}

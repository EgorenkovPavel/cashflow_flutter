
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/data/sources/local/data/database.dart';

part 'account_balance_entity.freezed.dart';

@freezed
class AccountBalanceEntity with _$AccountBalanceEntity{
  const factory AccountBalanceEntity({
    required AccountDB account,
    required int sum,
}) = _AccountBalanceEntity;
  // final AccountDB account;
  // final int sum;
  //
  // const AccountBalanceEntity(this.account, this.sum);
  //
  // @override
  // List<Object?> get props => [account, sum];
}

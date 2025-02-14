import 'package:equatable/equatable.dart';

import '../../../utils/sum.dart';
import 'account.dart';

sealed class BaseAccountBalance extends Equatable {
  final BaseAccount account;
  final Balance balance;

  const BaseAccountBalance({
    required this.account,
    required this.balance,
  });

  static BaseAccountBalance fromAccount(BaseAccount account) => switch (account) {
        Account() => AccountBalance(account: account, balance: Balance()),
        Debt() => DebtBalance(account: account, balance: Balance()),
      };
}

class AccountBalance extends BaseAccountBalance {
  const AccountBalance({
    required Account super.account,
    required super.balance,
  });

  @override
  List<Object?> get props => [account, balance];
}

class DebtBalance extends BaseAccountBalance {
  const DebtBalance({
    required Debt super.account,
    required super.balance,
  });

  @override
  List<Object?> get props => [account, balance];
}

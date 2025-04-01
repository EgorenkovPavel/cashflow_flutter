import 'package:equatable/equatable.dart';

import '../../../utils/sum.dart';
import '../../models.dart';

sealed class BaseAccountBalanceListItem extends Equatable {
  final int accountId;
  final int? userId;
  final String accountTitle;
  final String userName;
  final String userPhoto;
  final Balance balance;

  const BaseAccountBalanceListItem({
    required this.accountId,
    required this.userId,
    required this.accountTitle,
    required this.userName,
    required this.userPhoto,
    required this.balance,
  });

  static BaseAccountBalanceListItem fromAccount(
          BaseAccount account, User user) =>
      switch (account) {
        Account() => AccountBalanceListItem(
            accountId: account.id,
            userId: account.userId,
            accountTitle: account.title,
            userName: user.name,
            userPhoto: user.photo,
            balance: Balance()),
        Debt() => DebtBalanceListItem(accountId: account.id,
            userId: account.userId,
            accountTitle: account.title,
            userName: user.name,
            userPhoto: user.photo,
            balance: Balance()),
      };

  BaseAccountListItem get account => switch(this){
    AccountBalanceListItem() => AccountListItem(id: accountId, title: accountTitle),
    DebtBalanceListItem() => DebtListItem(id: accountId, title: accountTitle),
  };
}

class AccountBalanceListItem extends BaseAccountBalanceListItem {
  const AccountBalanceListItem({
    required super.accountId,
    required super.userId,
    required super.accountTitle,
    required super.userName,
    required super.userPhoto,
    required super.balance,
  });

  @override
  List<Object?> get props =>
      [accountId, userId, accountTitle, userName, userPhoto, balance];
}

class DebtBalanceListItem extends BaseAccountBalanceListItem {
  const DebtBalanceListItem({
    required super.accountId,
    required super.userId,
    required super.accountTitle,
    required super.userName,
    required super.userPhoto,
    required super.balance,
  });

  @override
  List<Object?> get props =>
      [accountId, userId, accountTitle, userName, userPhoto, balance];
}

import 'package:equatable/equatable.dart';

import '../../utils/sum.dart';
import '../models.dart';
import '../view_models.dart';

class AccountBalanceView extends Equatable {
  final int accountId;
  final int? userId;
  final String accountTitle;
  final String userName;
  final String userPhoto;
  final Balance balance;
  final bool isDebt;

  const AccountBalanceView({
    required this.accountId,
    required this.userId,
    required this.accountTitle,
    required this.userName,
    required this.userPhoto,
    required this.balance,
    required this.isDebt,
  });

  static AccountBalanceView fromAccount(BaseAccount account, User user) =>
      switch (account) {
        Account() => AccountBalanceView(
            accountId: account.id,
            userId: account.userId,
            accountTitle: account.title,
            userName: user.name,
            userPhoto: user.photo,
            balance: Balance(),
            isDebt: false,
          ),
        Debt() => AccountBalanceView(
            accountId: account.id,
            userId: account.userId,
            accountTitle: account.title,
            userName: user.name,
            userPhoto: user.photo,
            balance: Balance(),
            isDebt: true,
          ),
      };

  AccountView get account => AccountView(id: accountId, title: accountTitle);

  @override
  List<Object?> get props =>
      [accountId, userId, accountTitle, userName, userPhoto, balance, isDebt];
}

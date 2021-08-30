
import 'account.dart';

class AccountBalance {
  final int id;
  final String title;
  final int balance;
  final bool isDebt;

  const AccountBalance({required this.id, required this.title, required this.balance, this.isDebt = false});

  AccountBalance copyWith({int? id, String? title, bool? isDebt, int? balance}) =>
      AccountBalance(
        id: id ?? this.id,
        title: title ?? this.title,
        isDebt: isDebt ?? this.isDebt,
        balance: balance ?? this.balance,
      );

  Account getAccount() => Account(id: id, title: title, isDebt: isDebt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AccountBalance &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}


import 'account.dart';

class AccountBalance {
  final int id;
  final String title;
  final int balance;

  const AccountBalance({required this.id, required this.title, required this.balance});

  AccountBalance copyWith({int? id, String? title, int? balance}) =>
      AccountBalance(
        id: id ?? this.id,
        title: title ?? this.title,
        balance: balance ?? this.balance,
      );

  Account getAccount() => Account(id: id, title: title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AccountBalance &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}

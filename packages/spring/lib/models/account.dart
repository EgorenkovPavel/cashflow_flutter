import 'models.dart';

typedef AccountId = AnalyticId;

abstract base class BaseAccount {
  final AccountId? id;
  final String name;
  final Currency currency;
  final UserId user;
  final int balance;

  BaseAccount({
    this.id,
    required this.name,
    required this.currency,
    required this.user,
    required this.balance,
  });

  factory BaseAccount.fromJson(Map<String, dynamic> data) {
    final bool isDebt = data['isDebt'];
    final id = data['id'];
    final name = data['name'];
    final currency = Currency.byName(data['currency']);
    final user = data['user'];
    final balance = data['balance'];

    if (isDebt) {
      return Debt(
        id: id,
        name: name,
        currency: currency,
        user: user,
        balance: balance,
      );
    } else {
      return Account(
        id: id,
        name: name,
        currency: currency,
        user: user,
        balance: balance,
      );
    }
  }

  Map<String, dynamic> toJson() {
    if (this is Account) {
      return {
        'id': id,
        'name': name,
        'currency': currency.toString(),
        'user': user,
        'isDebt': false,
      };
    } else {
      return {
        'id': id,
        'name': name,
        'currency': currency.toString(),
        'user': user,
        'isDebt': true,
      };
    }
  }

  BaseAccount copyWith({AccountId? id, String? name});
}

final class Account extends BaseAccount {
  Account({
    super.id,
    required super.name,
    required super.currency,
    required super.user,
    required super.balance,
  });

  @override
  Account copyWith({AccountId? id, String? name}) => Account(
        id: id ?? this.id,
        name: name ?? this.name,
        currency: currency,
        user: user,
        balance: balance,
      );
}

final class Debt extends BaseAccount {
  Debt({
    super.id,
    required super.name,
    required super.currency,
    required super.user,
    required super.balance,
  });

  @override
  Debt copyWith({AccountId? id, String? name}) => Debt(
        id: id ?? this.id,
        name: name ?? this.name,
        currency: currency,
        user: user,
        balance: balance,
      );
}

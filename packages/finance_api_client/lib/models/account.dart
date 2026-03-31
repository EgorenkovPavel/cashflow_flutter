import 'models.dart';

typedef AccountId = AnalyticId;

abstract base class BaseAccount {
  final AccountId? id;
  final String name;
  final UserId user;

  BaseAccount({
    this.id,
    required this.name,
    required this.user,
  });

  factory BaseAccount.fromJson(Map<String, dynamic> data) {
    final bool isDebt = data['isDebt'];
    final id = data['id'];
    final name = data['name'];
    final user = data['user'];

    if (isDebt) {
      return Debt(
        id: id,
        name: name,
        user: user,
      );
    } else {
      return Account(
        id: id,
        name: name,
        user: user,
      );
    }
  }

  Map<String, dynamic> toJson() {
    if (this is Account) {
      return {
        'id': id,
        'name': name,
        'user': user,
        'isDebt': false,
      };
    } else {
      return {
        'id': id,
        'name': name,
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
    required super.user,
  });

  @override
  Account copyWith({
    AccountId? id,
    String? name,
  }) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        user: user,
      );
}

final class Debt extends BaseAccount {
  Debt({
    super.id,
    required super.name,
    required super.user,
  });

  @override
  Debt copyWith({
    AccountId? id,
    String? name,
  }) =>
      Debt(
        id: id ?? this.id,
        name: name ?? this.name,
        user: user,
      );
}

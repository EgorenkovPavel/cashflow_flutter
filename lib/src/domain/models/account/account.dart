import 'package:equatable/equatable.dart';

import '../user.dart';

sealed class BaseAccount extends Equatable {
  final int id;
  final String cloudId;
  final String title;
  final User? user;

  const BaseAccount({
    required this.id,
    required this.cloudId,
    required this.title,
    required this.user,
  });
}

class Account extends BaseAccount {
  const Account(
      {super.id = 0,
      super.cloudId = '',
      required super.title,
      required super.user});

  @override
  List<Object?> get props => [id, cloudId, title, user];

  Account copyWith({
    int? id,
    String? cloudId,
    String? title,
  }) =>
      Account(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        user: this.user,
      );
}

class Debt extends BaseAccount {
  const Debt(
      {super.id = 0,
      super.cloudId = '',
      required super.title,
      required super.user});

  @override
  List<Object?> get props => [id, cloudId, title, user];

  Debt copyWith({
    int? id,
    String? cloudId,
    String? title,
  }) =>
      Debt(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        user: this.user,
      );
}

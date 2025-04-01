import 'package:equatable/equatable.dart';

sealed class BaseAccount extends Equatable {
  final int id;
  final String cloudId;
  final String title;
  final int? userId;

  const BaseAccount({
    required this.id,
    required this.cloudId,
    required this.title,
    required this.userId,
  });
}

class Account extends BaseAccount {
  const Account(
      {super.id = 0,
      super.cloudId = '',
      required super.title,
      required super.userId});

  @override
  List<Object?> get props => [id, cloudId, title, userId];

  Account setUser(int? userId) => Account(
    id: id,
    cloudId: cloudId,
    title: title,
    userId: userId,
  );

  Account copyWith({
    int? id,
    String? cloudId,
    String? title,
  }) =>
      Account(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        userId: userId,
      );
}

class Debt extends BaseAccount {
  const Debt(
      {super.id = 0,
      super.cloudId = '',
      required super.title,
      required super.userId});

  @override
  List<Object?> get props => [id, cloudId, title, userId];

  Debt setUser(int? userId) => Debt(
    id: id,
    cloudId: cloudId,
    title: title,
    userId: userId,
  );

  Debt copyWith({
    int? id,
    String? cloudId,
    String? title,
  }) =>
      Debt(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        userId: userId,
      );
}

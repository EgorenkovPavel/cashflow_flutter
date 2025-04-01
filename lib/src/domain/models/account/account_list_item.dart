import 'package:equatable/equatable.dart';

sealed class BaseAccountListItem extends Equatable{
  final int id;
  final String title;

  const BaseAccountListItem({required this.id, required this.title});
}

class AccountListItem extends BaseAccountListItem{
  const AccountListItem({required super.id, required super.title});

  @override
  List<Object?> get props => [id, title];
}

class DebtListItem extends BaseAccountListItem{
  const DebtListItem({required super.id, required super.title});

  @override
  List<Object?> get props => [id, title];
}
import 'package:equatable/equatable.dart';

class AccountView extends Equatable{
  final int id;
  final String title;

  const AccountView({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}
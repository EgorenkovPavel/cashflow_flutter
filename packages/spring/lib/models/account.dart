import 'package:spring/models/currency.dart';
import 'package:spring/models/models.dart';
import 'package:spring/models/user.dart';

typedef AccountId = AnalyticId;

class Account {
  final AccountId? id;
  final String name;
  final bool isDebt;
  final Currency currency;
  final UserId user;

  Account(
      {this.id,
      required this.name,
      required this.isDebt,
      required this.currency,
      required this.user});
}

import 'package:spring/models/models.dart';

typedef OperationId = int;
typedef AnalyticId = int;

class Operation {
  final OperationId? id;
  final DateTime date;
  final OperationType type;
  final AccountId account;
  final AnalyticId analytic;
  final int sumSent;
  final int sumReceived;
  final Currency currencySent;
  final Currency currencyReceived;
  final UserId user;

  Operation(
      {required this.id,
      required this.date,
      required this.type,
      required this.account,
      required this.analytic,
      required this.sumSent,
      required this.sumReceived,
      required this.currencySent,
      required this.currencyReceived,
      required this.user});
}

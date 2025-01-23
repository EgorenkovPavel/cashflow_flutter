import 'models.dart';

typedef OperationId = int;
typedef AnalyticId = int;

abstract base class Operation {
  final OperationId? id;
  final DateTime date;
  final AccountId account;
  final AnalyticId analytic;
  final int sumSent;
  final int sumReceived;
  final Currency currencySent;
  final Currency currencyReceived;
  final UserId user;

  Operation(
      {this.id,
      required this.date,
      required this.account,
      required this.analytic,
      required this.sumSent,
      required this.sumReceived,
      required this.currencySent,
      required this.currencyReceived,
      required this.user});

  factory Operation.fromJson(Map<String, dynamic> data) {
    final OperationType type = OperationType.fromString(data['type']);
    final id = data['id'];
    final date = DateTime.parse(data['date']);
    final account = data['account'];
    final analytic = data['analytic'];
    final sumSent = data['sumSent'];
    final sumReceived = data['sumReceived'];
    final currencySent = Currency.byName(data['currencySent']);
    final currencyReceived = Currency.byName(data['currencyReceived']);
    final user = data['user'];

    return switch (type) {
      OperationType.input => InputOperation(
          id: id,
          date: date,
          account: account,
          analytic: analytic,
          sum: sumSent,
          currency: currencySent,
          user: user,
        ),
      OperationType.output => OutputOperation(
          id: id,
          date: date,
          account: account,
          analytic: analytic,
          sum: sumSent,
          currency: currencySent,
          user: user,
        ),
      OperationType.transfer => TransferOperation(
          id: id,
          date: date,
          account: account,
          analytic: analytic,
          sumSent: sumSent,
          sumReceived: sumReceived,
          currencySent: currencySent,
          currencyReceived: currencyReceived,
          user: user,
        ),
    };
  }

  Map<String, dynamic> toJson();

  Operation copyWithId(OperationId id);
}

final class InputOperation extends Operation {
  InputOperation(
      {super.id,
      required super.date,
      required super.account,
      required super.analytic,
      required int sum,
      required Currency currency,
      required super.user})
      : super(
            sumSent: sum,
            sumReceived: sum,
            currencySent: currency,
            currencyReceived: currency);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'type': OperationType.input.toString(),
        'account': account,
        'analytic': analytic,
        'sumSent': sumSent,
        'sumReceived': sumReceived,
        'currencySent': currencySent.toString(),
        'currencyReceived': currencyReceived.toString(),
        'user': user,
      };

  @override
  InputOperation copyWithId(OperationId id) => InputOperation(
        id: id,
        date: date,
        account: account,
        analytic: analytic,
        sum: sumSent,
        currency: currencySent,
        user: user,
      );
}

final class OutputOperation extends Operation {
  OutputOperation(
      {super.id,
      required super.date,
      required super.account,
      required super.analytic,
      required int sum,
      required Currency currency,
      required super.user})
      : super(
            sumSent: sum,
            sumReceived: sum,
            currencySent: currency,
            currencyReceived: currency);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'type': OperationType.output.toString(),
        'account': account,
        'analytic': analytic,
        'sumSent': sumSent,
        'sumReceived': sumReceived,
        'currencySent': currencySent.toString(),
        'currencyReceived': currencyReceived.toString(),
        'user': user,
      };

  @override
  OutputOperation copyWithId(OperationId id) => OutputOperation(
        id: id,
        date: date,
        account: account,
        analytic: analytic,
        sum: sumSent,
        currency: currencySent,
        user: user,
      );
}

final class TransferOperation extends Operation {
  TransferOperation(
      {super.id,
      required super.date,
      required super.account,
      required super.analytic,
      required super.sumSent,
      required super.sumReceived,
      required super.currencySent,
      required super.currencyReceived,
      required super.user});

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'type': OperationType.transfer.toString(),
        'account': account,
        'analytic': analytic,
        'sumSent': sumSent,
        'sumReceived': sumReceived,
        'currencySent': currencySent.toString(),
        'currencyReceived': currencyReceived.toString(),
        'user': user,
      };

  @override
  TransferOperation copyWithId(OperationId id) => TransferOperation(
        id: id,
        date: date,
        account: account,
        analytic: analytic,
        sumSent: sumSent,
        sumReceived: sumReceived,
        currencySent: currencySent,
        currencyReceived: currencyReceived,
        user: user,
      );
}

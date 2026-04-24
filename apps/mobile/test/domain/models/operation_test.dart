import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/src/domain/models.dart';

void main() {
  test('Get operation type by class type', () {
    expect(
      Operation.input(
        date: DateTime.now(),
        account: 1,
        category: 1,
        sum: Money(0, .RUB),
      ).operationType,
      OperationType.INPUT,
    );
    expect(
      Operation.output(
        date: DateTime.now(),
        account: 1,
        category: 1,
        sum: Money(0, .RUB),
      ).operationType,
      OperationType.OUTPUT,
    );
    expect(
      Operation.transfer(
        date: DateTime.now(),
        accountSend: 1,
        accountReceived: 1,
        sum: Money(0, .RUB),
      ).operationType,
      OperationType.TRANSFER,
    );
    expect(
      Operation.exchange(
        date: DateTime.now(),
        account: 1,
        sumSend: Money(0, .RUB),
        sumReceived: Money(0, .RUB),
      ).operationType,
      OperationType.EXCHANGE,
    );
  });
}

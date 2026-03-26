import 'package:money_tracker/src/domain/models.dart';
import 'package:drift/drift.dart';

class OperationTypeConverter extends TypeConverter<OperationType, int> {
  const OperationTypeConverter();

  @override
  OperationType fromSql(int fromDb) => switch (fromDb) {
    1 => OperationType.INPUT,
    2 => OperationType.OUTPUT,
    3 => OperationType.TRANSFER,
    4 => OperationType.EXCHANGE,
    _ => throw Exception('No such type'),
  };

  @override
  int toSql(OperationType value) => switch (value) {
    OperationType.INPUT => 1,
    OperationType.OUTPUT => 2,
    OperationType.TRANSFER => 3,
    OperationType.EXCHANGE => 4,
  };
}

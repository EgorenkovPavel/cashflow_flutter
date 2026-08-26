
import 'package:finance_models/finance_models.dart';
import 'package:firebase_api_client/src/converters/type_converter.dart';

class OperationTypeConverter extends TypeConverter<OperationType, int> {
  const OperationTypeConverter();

  @override
  OperationType fromCloud(int fromDb) => switch (fromDb) {
    1 => OperationType.INPUT,
    2 => OperationType.OUTPUT,
    3 => OperationType.TRANSFER,
    4 => OperationType.EXCHANGE,
    _ => throw Exception('No such type'),
  };

  @override
  int toCloud(OperationType value) => switch (value) {
    OperationType.INPUT => 1,
    OperationType.OUTPUT => 2,
    OperationType.TRANSFER => 3,
    OperationType.EXCHANGE => 4,
  };
}

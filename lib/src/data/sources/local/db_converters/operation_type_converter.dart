
import 'package:money_tracker/src/domain/models.dart';
import 'package:drift/drift.dart';

class OperationTypeConverter extends TypeConverter<OperationType, int> {
  const OperationTypeConverter();

  @override
  OperationType fromSql(int fromDb) {

    switch (fromDb) {
      case 1:
        return OperationType.INPUT;
      case 2:
        return OperationType.OUTPUT;
      case 3:
        return OperationType.TRANSFER;
      case 4:
        return OperationType.EXCHANGE;
      default:
        throw Exception('No such type');
    }
  }

  @override
  int toSql(OperationType value) {
    switch (value) {
      case OperationType.INPUT:
        return 1;
      case OperationType.OUTPUT:
        return 2;
      case OperationType.TRANSFER:
        return 3;
      case OperationType.EXCHANGE:
        return 4;
    }
  }
}

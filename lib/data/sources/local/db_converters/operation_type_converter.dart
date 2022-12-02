
import 'package:money_tracker/domain/models.dart';
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
      default:
        return OperationType.INPUT; //TODO
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
    }
  }
}

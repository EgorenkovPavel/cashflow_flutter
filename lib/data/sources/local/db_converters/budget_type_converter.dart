import 'package:money_tracker/domain/models.dart';
import 'package:drift/drift.dart';

class BudgetTypeConverter extends TypeConverter<BudgetType, int> {
  const BudgetTypeConverter();

  @override
  BudgetType fromSql(int fromDb) {
    switch (fromDb) {
      case 1:
        return BudgetType.MONTH;
      case 2:
        return BudgetType.YEAR;
      default:
        return BudgetType.MONTH; // TODO
    }
  }

  @override
  int toSql(BudgetType value) {
    switch (value) {
      case BudgetType.MONTH:
        return 1;
      case BudgetType.YEAR:
        return 2;
    }
  }
}

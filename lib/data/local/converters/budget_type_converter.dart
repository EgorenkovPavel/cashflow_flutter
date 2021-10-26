import 'package:money_tracker/domain/models.dart';
import 'package:moor/moor.dart';

class BudgetTypeConverter extends TypeConverter<BudgetType, int> {
  const BudgetTypeConverter();

  @override
  BudgetType? mapToDart(int? fromDb) {
    if (fromDb == null) {
      return null;
    }

    switch (fromDb) {
      case 1:
        return BudgetType.MONTH;
      case 2:
        return BudgetType.YEAR;
      default:
        return null;
    }
  }

  @override
  int? mapToSql(BudgetType? value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case BudgetType.MONTH:
        return 1;
      case BudgetType.YEAR:
        return 2;
      default:
        return null;
    }
  }
}

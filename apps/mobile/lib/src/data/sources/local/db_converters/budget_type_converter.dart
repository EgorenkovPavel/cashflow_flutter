import 'package:money_tracker/src/domain/models.dart';
import 'package:drift/drift.dart';

class BudgetTypeConverter extends TypeConverter<BudgetType, int> {
  const BudgetTypeConverter();

  @override
  BudgetType fromSql(int fromDb) => switch (fromDb) {
    1 => BudgetType.MONTH,
    2 => BudgetType.YEAR,
    _ => throw Exception('No such budget type'),
  };

  @override
  int toSql(BudgetType value) => switch (value) {
    BudgetType.MONTH => 1,
    BudgetType.YEAR => 2,
  };
}

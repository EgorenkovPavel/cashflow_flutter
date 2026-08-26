
import 'package:finance_models/finance_models.dart';
import 'package:firebase_api_client/src/converters/type_converter.dart';

class BudgetTypeConverter extends TypeConverter<BudgetType, int> {
  const BudgetTypeConverter();

  @override
  BudgetType fromCloud(int fromDb) => switch (fromDb) {
    1 => BudgetType.MONTH,
    2 => BudgetType.YEAR,
    _ => throw Exception('No such budget type'),
  };

  @override
  int toCloud(BudgetType value) => switch (value) {
    BudgetType.MONTH => 1,
    BudgetType.YEAR => 2,
  };
}

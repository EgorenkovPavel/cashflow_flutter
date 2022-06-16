import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/domain/models/enum/budget_type.dart';

void main(){
  late BudgetTypeConverter converter;

  setUp((){
    converter = const BudgetTypeConverter();
  });

  group('map budget type to sql', () {

    test('should return 1 when budget type MONTH', (){
      expect(1, converter.mapToSql(BudgetType.MONTH));
    });

    test('should return 2 when budget type YEAR', (){
      expect(2, converter.mapToSql(BudgetType.YEAR));
    });

  });

  group('map sql to dart',(){
    test('should return MONTH when input 1', (){
      expect(BudgetType.MONTH, converter.mapToDart(1));
    });

    test('should return YEAR when input 2', (){
      expect(BudgetType.YEAR, converter.mapToDart(2));
    });
  });

}
import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/src/data/sources/local/db_converters/budget_type_converter.dart';
import 'package:money_tracker/src/domain/models.dart';

void main(){
  late BudgetTypeConverter converter;

  setUp((){
    converter = const BudgetTypeConverter();
  });

  group('map budget type to sql', () {

    test('should return 1 when budget type MONTH', (){
      expect(1, converter.toSql(BudgetType.MONTH));
    });

    test('should return 2 when budget type YEAR', (){
      expect(2, converter.toSql(BudgetType.YEAR));
    });

  });

  group('map sql to dart',(){
    test('should return MONTH when input 1', (){
      expect(BudgetType.MONTH, converter.fromSql(1));
    });

    test('should return YEAR when input 2', (){
      expect(BudgetType.YEAR, converter.fromSql(2));
    });

    test('should return Exception when input 3', (){
      expect(() => converter.fromSql(3), throwsA(isA<Exception>()));
    });
  });

}
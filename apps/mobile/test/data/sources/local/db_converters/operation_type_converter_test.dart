import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/domain/models.dart';

void main(){
  late OperationTypeConverter converter;

  setUp((){
    converter = const OperationTypeConverter();
  });

  group('map operation type to sql', () {

    test('should return 1 when operation type INPUT', (){
      expect(1, converter.mapToSql(OperationType.INPUT));
    });

    test('should return 2 when operation type OUTPUT', (){
      expect(2, converter.mapToSql(OperationType.OUTPUT));
    });

    test('should return 3 when operation type TRANSFER', (){
      expect(3, converter.mapToSql(OperationType.TRANSFER));
    });

  });

  group('map sql to dart',(){
    test('should return INPUT when input 1', (){
      expect(OperationType.INPUT, converter.mapToDart(1));
    });

    test('should return OUTPUT when input 2', (){
      expect(OperationType.OUTPUT, converter.mapToDart(2));
    });

    test('should return TRANSFER when input 3', (){
      expect(OperationType.TRANSFER, converter.mapToDart(3));
    });
  });

}
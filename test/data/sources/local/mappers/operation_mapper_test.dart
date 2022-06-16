import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/data/sources/local/mappers/operation_mapper.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/enum/operation_type.dart';

void main() {
  late OperationMapper mapper;

  setUp(() {
    mapper = const OperationMapper();
  });

  test('should return entity with synced = false', () {
    expect(
        OperationDB(
            id: 1,
            cloudId: '1',
            date: DateTime(2000),
            operationType: OperationType.INPUT,
            account: 1,
            category: 2,
            recAccount: null,
            sum: 1000,
            synced: false,
            deleted: true),
        mapper.mapToOperationData(Operation(
            id: 1,
            deleted: true,
            cloudId: '1',
            synced: true,
            date: DateTime(2000),
            type: OperationType.INPUT,
            account: Account(
              id: 1,
              title: 'title',
              cloudId: '2',
              isDebt: true,
            ),
            category: Category(
              id: 2,
              title: 'title',
              cloudId: '2',
              operationType: OperationType.INPUT,
              budgetType: BudgetType.MONTH,
              budget: 100,
            ),
            recAccount: null,
            sum: 1000)));
  });
}

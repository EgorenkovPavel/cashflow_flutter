import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/entities/category_month_cashflow_entity.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/data/sources/local/mappers/category_month_cashflow_mapper.dart';
import 'package:money_tracker/domain/models.dart';

void main() {
  late CategoryMonthCashflowMapper mapper;

  setUp(() {
    mapper = const CategoryMonthCashflowMapper();
  });

  test('should return entity with synced = false', () {
    expect(
        CategoryMonthCashflowEntity(
            category: CategoryDB(
              id: 1,
              title: 'title',
              cloudId: '1',
              operationType: OperationType.INPUT,
              budgetType: BudgetType.MONTH,
              budget: 100,
              synced: false,
            ),
            cashflow: 1000,
            month: 1),
        mapper.mapToSql(CategoryMonthCashflow(
            category: Category(
              id: 1,
              title: 'title',
              cloudId: '1',
              operationType: OperationType.INPUT,
              budgetType: BudgetType.MONTH,
              budget: 100,
            ),
            month: 1,
            cashflow: 1000)));
  });
}

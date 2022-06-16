import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/entities/category_cashflow_entity.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/data/sources/local/mappers/category_cashflow_mapper.dart';
import 'package:money_tracker/domain/models.dart';

void main() {
  late CategoryCashflowMapper mapper;

  setUp(() {
    mapper = const CategoryCashflowMapper();
  });

  test('should return entity with synced = false', () {
    expect(CategoryCashflowEntity(category: CategoryDB(
      id: 1,
      title: 'title',
      cloudId: '1',
      operationType: OperationType.INPUT,
      budgetType: BudgetType.MONTH,
      budget: 100,
      synced: false,),
        monthCashflow: 1000,
        yearCashflow: 2000), mapper.mapToSql(CategoryCashflow(
        category: Category(id: 1,
          title: 'title',
          operationType: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
          budget: 100,
          cloudId: '1',), monthCashflow: 1000, yearCashflow: 2000)));
  });
}
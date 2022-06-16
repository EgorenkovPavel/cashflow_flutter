import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/data/sources/local/mappers/category_mapper.dart';
import 'package:money_tracker/domain/models.dart';

void main() {
  late CategoryMapper mapper;

  setUp(() {
    mapper = const CategoryMapper();
  });

  test('should return category with synced = false', () {
    expect(
        CategoryDB(
          id: 1,
          title: 'title',
          cloudId: '1',
          operationType: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
          budget: 1000,
          synced: false,
        ),
        mapper.mapToSql(Category(
          id: 1,
          cloudId: '1',
          budgetType: BudgetType.MONTH,
          budget: 1000,
          title: 'title',
          operationType: OperationType.INPUT,
        )));
  });
}

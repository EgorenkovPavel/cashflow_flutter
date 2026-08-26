import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/src/domain/models.dart';

void main() {
  group('Category.parentId', () {
    test('Parent id of group should return null', () {
      final Category category = Category.group(
        type: CategoryType.INPUT,
        title: '',
      );

      expect(category.parentId, isNull);
    });

    test('Parent id of item should return field', () {
      final Category category = Category.item(
        type: CategoryType.INPUT,
        title: '',
        budget: 0,
        budgetType: BudgetType.MONTH,
        parentId: 47,
      );

      expect(category.parentId, 47);
    });
  });

  group('Category.monthBudget', () {
    test('group returns 0', () {
      expect(
        Category.group(type: CategoryType.INPUT, title: '').monthBudget,
        0,
      );
    });

    test('item with month budget returns same value', () {
      expect(
        Category.item(
          type: CategoryType.INPUT,
          title: '',
          budget: 120,
          budgetType: BudgetType.MONTH,
          parentId: null,
        ).monthBudget,
        120,
      );
    });

    test('item with year budget returns monthly value', () {
      expect(
        Category.item(
          type: CategoryType.INPUT,
          title: '',
          budget: 1200,
          budgetType: BudgetType.YEAR,
          parentId: null,
        ).monthBudget,
        100,
      );
    });
  });
}

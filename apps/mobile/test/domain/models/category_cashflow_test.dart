import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/src/domain/models.dart';

void main() {

    late CategoryCashFlow monthCashflow;
    late CategoryCashFlow yearCashflow;

    setUp(() {
      monthCashflow = CategoryCashFlow(
          categoryId: 1,
          type: CategoryType.INPUT,
          categoryTitle: '',
          budgetType: BudgetType.MONTH,
          budget: 1200,
          monthCashFlow: Balance([Money(10, Currency.RUB)]),
          yearCashFlow: Balance([Money(20, Currency.RUB)]),
          parentId: null);
      yearCashflow = CategoryCashFlow(
          categoryId: 1,
          type: CategoryType.INPUT,
          categoryTitle: '',
          budgetType: BudgetType.YEAR,
          budget: 1200,
          monthCashFlow: Balance([Money(10, Currency.RUB)]),
          yearCashFlow: Balance([Money(20, Currency.RUB)]),
          parentId: null);
    });

    test('Budget should return budget', () {
      expect(monthCashflow.budgetByType(BudgetType.MONTH), 1200);
      expect(monthCashflow.budgetByType(BudgetType.YEAR), 14400);
      expect(yearCashflow.budgetByType(BudgetType.MONTH), 100);
      expect(yearCashflow.budgetByType(BudgetType.YEAR), 1200);
    });

    test('Cashflow should return cashflow', () {
      expect(monthCashflow.cashFlowByType(BudgetType.MONTH), Balance([Money(10, Currency.RUB)]));
      expect(monthCashflow.cashFlowByType(BudgetType.YEAR), Balance([Money(20, Currency.RUB)]));
      expect(yearCashflow.cashFlowByType(BudgetType.MONTH), Balance([Money(10, Currency.RUB)]));
      expect(yearCashflow.cashFlowByType(BudgetType.YEAR), Balance([Money(20, Currency.RUB)]));
    });
}
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';

class CategoryCashflowBudgetMapper
    extends Mapper<CategoryCashflowBudget, CategoryCashflowBudgetEntity> {
  const CategoryCashflowBudgetMapper();

  CategoryCashflowBudgetEntity mapToSql(CategoryCashflowBudget c) {
    return CategoryCashflowBudgetEntity(
        c.year,
        c.month,
        CategoryData(
            id: c.id,
            title: c.title,
            operationType: c.type,
            archive: c.archive),
        c.budget,
        c.cashflow);
  }

  CategoryCashflowBudget mapToDart(CategoryCashflowBudgetEntity c) {
    return CategoryCashflowBudget(
        id: c.category.id,
        title: c.category.title,
        archive: c.category.archive,
        type: c.category.operationType,
        year: c.year,
        month: c.month,
        budget: c.budget,
        cashflow: c.cashflow);
  }
}

import 'package:cashflow/data/database/database.dart';
import 'package:cashflow/data/mappers/mapper.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';

class CategoryCashflowBudgetMapper
    extends Mapper<CategoryCashflowBudget, CategoryCashflowBudgetEntity> {
  const CategoryCashflowBudgetMapper();

  @override
  CategoryCashflowBudgetEntity mapToSql(CategoryCashflowBudget c) {
    return CategoryCashflowBudgetEntity(
        c.year,
        c.month,
        CategoryDB(
            id: c.id,
            title: c.title,
            operationType: c.type,),
        c.budget,
        c.cashflow);
  }

  @override
  CategoryCashflowBudget mapToDart(CategoryCashflowBudgetEntity c) {
    return CategoryCashflowBudget(
        id: c.category.id,
        title: c.category.title,
        type: c.category.operationType,
        year: c.year,
        month: c.month,
        budget: c.budget,
        cashflow: c.cashflow);
  }
}

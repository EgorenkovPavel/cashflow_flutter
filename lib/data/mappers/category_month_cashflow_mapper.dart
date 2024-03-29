import 'package:money_tracker/data/local/data/category_dao.dart';
import 'package:money_tracker/domain/models/category_month_cashflow.dart';

import 'category_mapper.dart';
import 'mapper.dart';

class CategoryMonthCashflowMapper
    extends Mapper<CategoryMonthCashflow, CategoryMonthCashflowEntity> {
  const CategoryMonthCashflowMapper();

  @override
  CategoryMonthCashflowEntity mapToSql(CategoryMonthCashflow c) {
    return CategoryMonthCashflowEntity(
      category: const CategoryMapper().mapToSql(c.category),
      month: c.month,
      cashflow: c.cashflow,
    );
  }

  @override
  CategoryMonthCashflow mapToDart(CategoryMonthCashflowEntity c) {
    return CategoryMonthCashflow(
      category: const CategoryMapper().mapToDart(c.category),
      month: c.month,
      cashflow: c.cashflow,
    );
  }
}

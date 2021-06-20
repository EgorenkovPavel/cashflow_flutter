import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/category_mapper.dart';
import 'package:money_tracker/domain/models.dart';

import 'mapper.dart';

class CategoryCashflowMapper
    extends Mapper<CategoryCashflow, CategoryCashflowEntity> {
  const CategoryCashflowMapper();

  @override
  CategoryCashflowEntity mapToSql(CategoryCashflow c) {
    return CategoryCashflowEntity(
      category: const CategoryMapper().mapToSql(c.category),
      cashflow: c.cashflow,
    );
  }

  @override
  CategoryCashflow mapToDart(CategoryCashflowEntity c) {
    return CategoryCashflow(
      category: const CategoryMapper().mapToDart(c.category),
      cashflow: c.cashflow,
    );
  }
}

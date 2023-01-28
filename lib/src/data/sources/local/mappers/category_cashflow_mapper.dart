import 'package:money_tracker/src/data/sources/local/mappers/category_mapper.dart';
import 'package:money_tracker/src/domain/models.dart';

import '../entities/category_cashflow_entity.dart';
import 'mapper.dart';

class CategoryCashflowMapper
    extends Mapper<CategoryCashflow, CategoryCashflowEntity> {
  const CategoryCashflowMapper();

  @override
  CategoryCashflowEntity mapToSql(CategoryCashflow c) {
    return CategoryCashflowEntity(
      category: const CategoryMapper().mapToSql(c.category),
      monthCashflow: c.monthCashflow,
      yearCashflow: c.yearCashflow,
    );
  }

  @override
  CategoryCashflow mapToDart(CategoryCashflowEntity c) {
    return CategoryCashflow(
      category: const CategoryMapper().mapToDart(c.category),
      monthCashflow: c.monthCashflow,
      yearCashflow: c.yearCashflow,
    );
  }
}

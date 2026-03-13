import 'package:rxdart/rxdart.dart';

import '../../domain/models/category/category_cashflow.dart';
import '../../domain/models/enum/category_type.dart';
import '../../domain/services/cashflow_service.dart';
import '../../utils/balance.dart';
import '../sources/local/data/category_dao.dart';
import '../sources/local/db_mapper.dart';

/// Implementation of [CashflowService] that aggregates category cashflow data.
class CashflowServiceImpl implements CashflowService {
  final CategoryDao _categoryDao;

  CashflowServiceImpl({
    required CategoryDao categoryDao,
  })  : _categoryDao = categoryDao;

  @override
  Stream<List<CategoryCashFlow>> watchCashFlow(DateTime date) {
    return Rx.combineLatest3(
        _categoryDao.watchAllCategoriesItems(),
        _categoryDao.watchMonthCashFlow(date, {}),
        _categoryDao.watchYearCashFlow(date, {}),
        CategoryMapper().combineCashFlow);
  }

  @override
  Stream<List<CategoryCashFlow>> watchCashFlowByType(
    DateTime date,
    CategoryType type,
  ) {
    return Rx.combineLatest3(
        _categoryDao.watchAllCategoriesByType(type),
        _categoryDao.watchMonthCashFlow(date, {}),
        _categoryDao.watchYearCashFlow(date, {}),
        CategoryMapper().combineCashFlow);
  }

  @override
  Future<Map<DateTime, Balance>> getMonthlyExpenses(
      int categoryId,
      int monthCount,
      ) => _categoryDao.getMonthlyExpenses(categoryId, monthCount);
}


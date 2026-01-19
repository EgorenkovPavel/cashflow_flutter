import 'package:rxdart/rxdart.dart';

import '../../domain/models/category/category_cashflow.dart';
import '../../domain/models/enum/category_type.dart';
import '../../domain/models/enum/operation_type.dart';
import '../../domain/services/cashflow_service.dart';
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
        _categoryDao.watchAllCategories(),
        _categoryDao.watchMonthCashFlow(date, {}),
        _categoryDao.watchYearCashFlow(date, {}),
        CategoryMapper().combineCashFlow);
  }

  @override
  Stream<List<CategoryCashFlow>> watchCashFlowByType(
    DateTime date,
    CategoryType type,
  ) {
    final operationType = switch (type) {
      CategoryType.INPUT => OperationType.INPUT,
      CategoryType.OUTPUT => OperationType.OUTPUT,
    };

    return Rx.combineLatest3(
        _categoryDao.watchAllCategoriesByType(operationType),
        _categoryDao.watchMonthCashFlow(date, {}),
        _categoryDao.watchYearCashFlow(date, {}),
        CategoryMapper().combineCashFlow);
  }

}


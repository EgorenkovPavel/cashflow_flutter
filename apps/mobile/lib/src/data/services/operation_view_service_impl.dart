import 'package:rxdart/rxdart.dart';

import '../../domain/models/operation/operation_list_filter.dart';
import '../../domain/services/operation_view_service.dart';
import '../../domain/view_models/operation_view.dart';
import '../sources/local/data/operation_dao.dart';
import '../sources/local/data/user_dao.dart';
import '../sources/local/db_mapper.dart';
import '../sources/local/entities/operation_entity.dart';

/// Implementation of [OperationViewService] that aggregates operation view data.
class OperationViewServiceImpl implements OperationViewService {
  final OperationDao _operationDao;
  final UserDao _userDao;

  OperationViewServiceImpl({
    required OperationDao operationDao,
    required UserDao userDao,
  }) : _operationDao = operationDao,
       _userDao = userDao;

  @override
  Stream<List<OperationView>> watchAllOperationsByAccount(int accountId) =>
      _combine(_operationDao.watchAllOperationItemsByAccount(accountId));

  @override
  Stream<List<OperationView>> watchAllOperationsByCategory(int categoryId) =>
      _combine(_operationDao.watchAllOperationItemsByCategory(categoryId));

  @override
  Stream<List<OperationView>> watchAllOperationsByFilter(
    OperationListFilter filter,
  ) => _combine(
    _operationDao.watchAllOperationItemsByFilter(
      start: filter.period?.start,
      end: filter.period?.end,
      accountIds: filter.accountIds,
      categoriesIds: filter.categoryIds,
    ),
  );

  @override
  Stream<List<OperationView>> watchLastOperations(int limit) =>
      _combine(_operationDao.watchLastOperationItems(limit));

  Stream<List<OperationView>> _combine(
    Stream<List<OperationDbEntity>> operations,
  ) => Rx.combineLatest2(
    operations,
    _userDao.watchAllUsers().map(UserMapper().listToModel),
    (operations, users) =>
        OperationMapper().entityListToItem(operations, users),
  );
}

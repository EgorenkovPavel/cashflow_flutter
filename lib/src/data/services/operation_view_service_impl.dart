import 'package:rxdart/rxdart.dart';

import '../../domain/interfaces/operation_repository.dart';
import '../../domain/interfaces/user_repository.dart';
import '../../domain/models/operation/operation_list_filter.dart';
import '../../domain/services/operation_view_service.dart';
import '../../domain/view_models/operation_list_item.dart';
import '../sources/local/data/operation_dao.dart';
import '../sources/local/data/user_dao.dart';
import '../sources/local/db_mapper.dart';

/// Implementation of [OperationViewService] that aggregates operation view data.
class OperationViewServiceImpl implements OperationViewService {
  final OperationRepository _operationRepository;
  final UserRepository _userRepository;
  final OperationDao _operationDao;
  final UserDao _userDao;

  OperationViewServiceImpl({
    required OperationRepository operationRepository,
    required UserRepository userRepository,
    required OperationDao operationDao,
    required UserDao userDao,
  })  : _operationRepository = operationRepository,
        _userRepository = userRepository,
        _operationDao = operationDao,
        _userDao = userDao;

  @override
  Stream<List<OperationView>> watchAllOperationsByAccount(int accountId) {
    return Rx.combineLatest2(
        _operationDao.watchAllOperationItemsByAccount(accountId),
        _userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }

  @override
  Stream<List<OperationView>> watchAllOperationsByCategory(int categoryId) {
    return Rx.combineLatest2(
        _operationDao.watchAllOperationItemsByCategory(categoryId),
        _userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }

  @override
  Stream<List<OperationView>> watchAllOperationsByFilter(
    OperationListFilter filter,
  ) {
    return Rx.combineLatest2(
        _operationDao.watchAllOperationItemsByFilter(
          start: filter.period?.start,
          end: filter.period?.end,
          accountIds: filter.accountIds,
          categoriesIds: filter.categoryIds,
        ),
        _userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }

  @override
  Stream<List<OperationView>> watchLastOperations(int limit) {
    return Rx.combineLatest2(
        _operationDao.watchLastOperationItems(limit),
        _userDao.watchAllUsers().map(UserMapper().listToModel),
        (operations, users) {
      return OperationMapper().entityListToItem(operations, users);
    });
  }
}


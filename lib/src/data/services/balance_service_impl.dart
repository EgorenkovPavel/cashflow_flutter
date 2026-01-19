import 'package:rxdart/rxdart.dart';

import '../../domain/services/balance_service.dart';
import '../../domain/view_models/account_balance_view.dart';
import '../sources/local/data/account_dao.dart';
import '../sources/local/data/database.dart';
import '../sources/local/data/user_dao.dart';
import '../sources/local/db_mapper.dart';
import '../sources/local/entities/account_balance_entity.dart';

/// Implementation of [BalanceService] that aggregates account, user, and balance data.
class BalanceServiceImpl implements BalanceService {
  final AccountDao _accountDao;
  final UserDao _userDao;

  BalanceServiceImpl({
    required AccountDao accountDao,
    required UserDao userDao,
  })  : _accountDao = accountDao,
        _userDao = userDao;

  @override
  Future<List<AccountBalanceView>> getAllBalance() async {
    final accounts = await _accountDao.getAllAccounts();
    final users = await _userDao.getAllUsers();
    final balances = await _accountDao.getAllBalances();
    return AccountMapper().combineBalances(accounts, users, balances);
  }

  @override
  Stream<List<AccountBalanceView>> watchAllBalance() =>
      Rx.combineLatest3<List<AccountDB>, List<UserDB>,
              List<AccountBalanceEntity>, List<AccountBalanceView>>(
          _accountDao.watchAllAccounts(),
          _userDao.watchAllUsers(),
          _accountDao.watchAllBalances(),
          AccountMapper().combineBalances);
}


import 'package:rxdart/rxdart.dart';

import '../../domain/interfaces/account_repository.dart';
import '../../domain/interfaces/user_repository.dart';
import '../../domain/services/balance_service.dart';
import '../../domain/view_models/account_balance_view.dart';
import '../sources/local/data/account_dao.dart';
import '../sources/local/data/database.dart';
import '../sources/local/data/user_dao.dart';
import '../sources/local/db_mapper.dart';
import '../sources/local/entities/account_balance_entity.dart';

/// Implementation of [BalanceService] that aggregates account, user, and balance data.
class BalanceServiceImpl implements BalanceService {
  final AccountRepository _accountRepository;
  final UserRepository _userRepository;
  final AccountDao _accountDao;
  final UserDao _userDao;

  BalanceServiceImpl({
    required AccountRepository accountRepository,
    required UserRepository userRepository,
    required AccountDao accountDao,
    required UserDao userDao,
  })  : _accountRepository = accountRepository,
        _userRepository = userRepository,
        _accountDao = accountDao,
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


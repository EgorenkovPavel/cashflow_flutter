import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/local/converters/budget_type_converter.dart';
import 'package:money_tracker/data/local/converters/operation_type_converter.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/data/remote/remote_source.dart';
import 'package:money_tracker/domain/models/user.dart';

import 'data/remote/models/cloud_models.dart';
import 'domain/models.dart';

abstract class SyncState {
  abstract final bool isAdmin;

  const SyncState();
}

class SyncState_InProgress extends SyncState {
  @override
  final bool isAdmin = false;

  const SyncState_InProgress();
}

class SyncState_LoadingToCloud extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_LoadingToCloud({required this.isAdmin});
}

class SyncState_LoadingFromCloud extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_LoadingFromCloud({required this.isAdmin});
}

class SyncState_Synced extends SyncState {
  @override
  final bool isAdmin;
  final DateTime syncDate;

  const SyncState_Synced({required this.isAdmin, required this.syncDate});
}

class SyncState_NotSynced extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_NotSynced({required this.isAdmin});
}

class SyncState_Failed extends SyncState {
  @override
  final bool isAdmin;

  const SyncState_Failed({required this.isAdmin});
}

class SyncState_NoDb extends SyncState {
  @override
  final bool isAdmin = false;

  const SyncState_NoDb();
}

class SyncBloc extends Cubit<SyncState> {
  final AuthBloc _authBloc;
  final LocalSource localSource;
  final RemoteSource remoteSource;
  final PrefsRepository prefsRepository;

  StreamSubscription? _syncSub;
  StreamSubscription? _adminSub;

  bool _isAdmin = false;

  SyncBloc({
    required AuthBloc authBloc,
    required this.localSource,
    required this.remoteSource,
    required this.prefsRepository,
  })  : _authBloc = authBloc,
        super(SyncState_NotSynced(isAdmin: false)) {
    _syncSub = _authBloc.stream.listen((event) async {
      if (event is AuthStateInProgress) {
        emit(SyncState_InProgress());
      } else if (event is AuthStateAuthenticated) {
        if (await _logIn(event.user.id)) {
          await syncNow();
        }
      } else {
        emit(SyncState_NotSynced(isAdmin: _isAdmin));
      }
    });
    _adminSub = remoteSource.isAdmin().listen((event) {
      _isAdmin = event;
    });
  }

  Future<void> _syncData(DateTime syncFrom) async {
    if (_authBloc.state is! AuthStateAuthenticated) {
      return;
    }

    emit(SyncState_LoadingToCloud(isAdmin: _isAdmin));
    await _loadToCloud();

    emit(SyncState_LoadingFromCloud(isAdmin: _isAdmin));
    var syncDate = DateTime.now();
    if (await _loadFromCloud(syncFrom)) {
      await prefsRepository.setSyncDate(syncDate);
      emit(SyncState_Synced(isAdmin: _isAdmin, syncDate: syncDate));
    } else {
      emit(SyncState_NotSynced(isAdmin: _isAdmin));
    }
  }

  Future<bool> _logIn(String userId) async {
    emit(SyncState_InProgress());
    var res = await remoteSource.databaseExists(userId);

    return res.fold((success) async {
      if (success) {
        var resLogIn = await remoteSource.logIn(userId);
        return resLogIn.fold((success) => true, (failure) {
          emit(SyncState_Failed(isAdmin: _isAdmin));
          return false;
        });
      } else {
        emit(SyncState_NoDb());
        return false;
      }
    }, (failure) {
      emit(SyncState_Failed(isAdmin: _isAdmin));
      return false;
    });
  }

  Future<bool> createCloudDatabase() async {
    if (_authBloc.state is AuthStateAuthenticated) {
      emit(SyncState_InProgress());
      var res = await remoteSource
          .createDatabase((_authBloc.state as AuthStateAuthenticated).user);
      if (res.isFailure()) {
        emit(SyncState_Failed(isAdmin: _isAdmin));
        return false;
      }

      emit(SyncState_LoadingToCloud(isAdmin: _isAdmin));
      await _loadToCloud();
      final syncDate = DateTime.now();
      await prefsRepository.setSyncDate(syncDate);

      emit(SyncState_Synced(isAdmin: _isAdmin, syncDate: syncDate));
      return true;
    } else {
      return false;
    }
  }

  void refreshConnection() => syncNow();

  Future<void> syncNow() => _syncData(prefsRepository.syncDate);

  Future<void> syncLastDay() =>
      _syncData(prefsRepository.syncDate.subtract(const Duration(days: 1)));

  Future<void> syncLastMonth() =>
      _syncData(prefsRepository.syncDate.subtract(const Duration(days: 30)));

  Future<void> syncAll() => _syncData(DateTime.utc(1970, 1, 1));

  Future<bool> addUser(User user) async {
    var res = await remoteSource.addNewUser(user);
    return res.fold((left) => false, (right) => true);
  }

  @override
  Future<void> close() {
    _syncSub?.cancel();
    _adminSub?.cancel();
    return super.close();
  }

  Future<bool> _loadFromCloud(DateTime date) async {
    var accounts = await remoteSource.getAccounts(date);
    var categories = await remoteSource.getCategories(date);
    var operations = await remoteSource.getOperations(date);

    if (accounts.isFailure() ||
        categories.isFailure() ||
        operations.isFailure()) {
      return false;
    }

    await _loadCloudAccounts(accounts.getOrDefault([]));
    await _loadCloudCategories(categories.getOrDefault([]));
    await _loadCloudOperations(operations.getOrDefault([]));

    return true;
  }

  Future<void> _loadCloudAccounts(Iterable<CloudAccount> list) async {
    await Future.forEach(list, (CloudAccount cloudAccount) async {
      print('Load from cloud account ${cloudAccount.title}');
      var _account = await localSource.accounts.getByCloudId(cloudAccount.id);
      if (_account == null) {
        await localSource.accounts.insertFromCloud(Account(
          cloudId: cloudAccount.id,
          title: cloudAccount.title,
          isDebt: cloudAccount.isDebt,
        ));
      } else {
        await localSource.accounts.updateFromCloud(_account.copyWith(
          title: cloudAccount.title,
          isDebt: cloudAccount.isDebt,
        ));
      }
    });
  }

  Future<void> _loadCloudCategories(Iterable<CloudCategory> list) async {
    await Future.forEach(list, (CloudCategory cloudCategory) async {
      print('Load from cloud category ${cloudCategory.title}');
      var _category =
          await localSource.categories.getByCloudId(cloudCategory.id);
      if (_category == null) {
        await localSource.categories.insertFromCloud(Category(
          title: cloudCategory.title,
          cloudId: cloudCategory.id,
          operationType: const OperationTypeConverter()
              .mapToDart(cloudCategory.operationType)!,
          budgetType:
              const BudgetTypeConverter().mapToDart(cloudCategory.budgetType)!,
          budget: cloudCategory.budget,
        ));
      } else {
        await localSource.categories.updateFromCloud(_category.copyWith(
          title: cloudCategory.title,
          cloudId: cloudCategory.id,
          operationType: const OperationTypeConverter()
              .mapToDart(cloudCategory.operationType),
          budgetType:
              const BudgetTypeConverter().mapToDart(cloudCategory.budgetType),
          budget: cloudCategory.budget,
        ));
      }
    });
  }

  Future<void> _loadCloudOperations(Iterable<CloudOperation> list) async {
    await Future.forEach(list, (CloudOperation cloudOperation) async {
      print('Load from cloud operation ${cloudOperation.id}');
      var _operation =
          await localSource.operations.getByCloudId(cloudOperation.id);

      var _account =
          await localSource.accounts.getByCloudId(cloudOperation.account);
      var _category = cloudOperation.category == null
          ? null
          : await localSource.categories.getByCloudId(cloudOperation.category!);
      var _recAccount = cloudOperation.recAccount == null
          ? null
          : await localSource.accounts.getByCloudId(cloudOperation.recAccount!);

      if (_operation == null && !cloudOperation.deleted) {
        await localSource.operations.insertFromCloud(Operation(
          cloudId: cloudOperation.id,
          date: cloudOperation.date,
          type: const OperationTypeConverter()
              .mapToDart(cloudOperation.operationType)!,
          account: _account!,
          category: _category,
          recAccount: _recAccount,
          sum: cloudOperation.sum,
        ));
      } else if (_operation != null && !cloudOperation.deleted) {
        await localSource.operations.updateFromCloud(_operation.copyWith(
          cloudId: cloudOperation.id,
          date: cloudOperation.date,
          type: const OperationTypeConverter()
              .mapToDart(cloudOperation.operationType),
          account: _account!,
          category: _category,
          recAccount: _recAccount,
          sum: cloudOperation.sum,
        ));
      } else if (_operation != null && cloudOperation.deleted) {
        await localSource.operations.deleteById(_operation.id);
      }
    });
  }

  CloudAccount _mapToCloudAccount(Account account) {
    return CloudAccount(
      id: account.cloudId,
      title: account.title,
      isDebt: account.isDebt,
      deleted: false,
    );
  }

  CloudCategory _mapToCloudCategory(Category category) {
    return CloudCategory(
      id: category.cloudId,
      title: category.title,
      operationType:
          const OperationTypeConverter().mapToSql(category.operationType)!,
      budgetType: const BudgetTypeConverter().mapToSql(category.budgetType)!,
      budget: category.budget,
      deleted: false,
    );
  }

  CloudOperation _mapToCloudOperation(Operation operation) {
    return CloudOperation(
      id: operation.cloudId,
      date: operation.date,
      operationType: const OperationTypeConverter().mapToSql(operation.type)!,
      account: operation.account.cloudId,
      category: operation.category?.cloudId,
      recAccount: operation.recAccount?.cloudId,
      sum: operation.sum,
      deleted: false,
    );
  }

  Future<void> _loadToCloud() async {
    await _loadAccountsToCloud();
    await _loadCategoriesToCloud();
    await _loadOperationsToCloud();
  }

  Future<void> _loadAccountsToCloud() async {
    var accounts = await localSource.accounts.getAllNotSynced();
    await Future.forEach(accounts, (Account account) async {
      print('Load to cloud account ${account.title}');
      if (account.cloudId.isNotEmpty) {
        var res = await remoteSource.updateAccount(_mapToCloudAccount(account));
        if (res.isSuccess()) {
          await localSource.accounts.markAsSynced(account.id, account.cloudId);
        }
      } else {
        var _cloudId =
            await remoteSource.addAccount(_mapToCloudAccount(account));
        if (_cloudId.isSuccess()) {
          var res = await localSource.accounts
              .markAsSynced(account.id, _cloudId.getOrDefault(''));
          print('$res');
        }
      }
    });
  }

  Future<void> _loadCategoriesToCloud() async {
    var categories = await localSource.categories.getAllNotSynced();
    await Future.forEach(categories, (Category category) async {
      print('Load to cloud category ${category.title}');
      if (category.cloudId.isNotEmpty) {
        var res =
            await remoteSource.updateCategory(_mapToCloudCategory(category));
        if (res.isSuccess()) {
          await localSource.categories
              .markAsSynced(category.id, category.cloudId);
        }
      } else {
        var _cloudId =
            await remoteSource.addCategory(_mapToCloudCategory(category));
        if (_cloudId.isSuccess()) {
          await localSource.categories
              .markAsSynced(category.id, _cloudId.getOrDefault(''));
        }
      }
    });
  }

  Future<void> _loadOperationsToCloud() async {
    var operations = await localSource.operations.getAllNotSynced();
    await Future.forEach(operations, (Operation operation) async {
      print('Load to cloud operation ${operation.id}');
      if (operation.cloudId.isNotEmpty) {
        var res =
            await remoteSource.updateOperation(_mapToCloudOperation(operation));
        if (res.isSuccess()) {
          await localSource.operations
              .markAsSynced(operation.id, operation.cloudId);
        }
      } else {
        var _cloudId =
            await remoteSource.addOperation(_mapToCloudOperation(operation));
        if (_cloudId.isSuccess()) {
          await localSource.operations
              .markAsSynced(operation.id, _cloudId.getOrDefault(''));
        }
      }
    });
  }
}

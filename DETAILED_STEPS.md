# Детальный план улучшений с примерами кода

## Фаза 1: Рефакторинг репозиториев - Детализация

### Шаг 1.1.1: Создание интерфейса AccountRepository

**Файл:** `lib/src/domain/interfaces/account_repository.dart`

```dart
import '../models/account/account.dart';

abstract class AccountRepository {
  Stream<List<BaseAccount>> watchAllAccounts();
  Future<List<BaseAccount>> getAllAccounts();
  Stream<BaseAccount> watchAccountById(int id);
  Future<BaseAccount> getAccountById(int id);
  Future<int> insertAccount(BaseAccount account);
  Future<void> updateAccount(BaseAccount account);
}
```

### Шаг 1.1.2: Создание интерфейса BalanceService

**Файл:** `lib/src/domain/services/balance_service.dart`

```dart
import '../view_models/account_balance_view.dart';

abstract class BalanceService {
  Stream<List<AccountBalanceView>> watchAllBalance();
  Future<List<AccountBalanceView>> getAllBalance();
}
```

### Шаг 1.1.3: Реализация AccountRepository

**Файл:** `lib/src/data/repositories/account_repository_impl.dart`

```dart
import 'package:money_tracker/src/data/sources/local/data/account_dao.dart';
import 'package:money_tracker/src/data/sources/local/db_mapper.dart';
import 'package:money_tracker/src/domain/interfaces/account_repository.dart';
import 'package:money_tracker/src/domain/models/account/account.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDao _accountDao;

  AccountRepositoryImpl(this._accountDao);

  @override
  Future<BaseAccount> getAccountById(int id) async {
    final account = await _accountDao.getAccountById(id);
    return AccountMapper().toModel(account);
  }

  @override
  Future<List<BaseAccount>> getAllAccounts() async {
    final accounts = await _accountDao.getAllAccounts();
    return AccountMapper().listToModel(accounts);
  }

  @override
  Future<int> insertAccount(BaseAccount account) =>
      _accountDao.insertAccount(AccountsCompanion(
        cloudId: Value(account.cloudId),
        title: Value(account.title),
        isDebt: Value(account is Debt),
        user: Value(account.userId),
      ));

  @override
  Future<void> updateAccount(BaseAccount account) =>
      _accountDao.updateAccount(AccountMapper().toDBO(account));

  @override
  Stream<BaseAccount> watchAccountById(int id) {
    return _accountDao.watchAccountById(id).map(AccountMapper().toModel);
  }

  @override
  Stream<List<BaseAccount>> watchAllAccounts() =>
      _accountDao.watchAllAccounts().map(AccountMapper().listToModel);
}
```

### Шаг 1.1.4: Реализация BalanceService

**Файл:** `lib/src/data/services/balance_service_impl.dart`

```dart
import 'package:money_tracker/src/data/sources/local/data/account_dao.dart';
import 'package:money_tracker/src/data/sources/local/data/user_dao.dart';
import 'package:money_tracker/src/data/sources/local/db_mapper.dart';
import 'package:money_tracker/src/data/sources/local/entities/account_balance_entity.dart';
import 'package:money_tracker/src/domain/interfaces/account_repository.dart';
import 'package:money_tracker/src/domain/interfaces/user_repository.dart';
import 'package:money_tracker/src/domain/services/balance_service.dart';
import 'package:money_tracker/src/domain/view_models/account_balance_view.dart';
import 'package:rxdart/rxdart.dart';

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
```

### Шаг 1.1.5: Обновление AccountInteractor

**Файл:** `lib/src/domain/interactors/account_interactor.dart`

```dart
import '../interfaces/account_repository.dart';
import '../models/account/account.dart';
import '../services/balance_service.dart';
import '../view_models/account_balance_view.dart';

class AccountInteractor {
  final AccountRepository _accountRepository;
  final BalanceService _balanceService;

  AccountInteractor(
    this._accountRepository,
    this._balanceService,
  );

  Future<BaseAccount> getById(int id) => 
      _accountRepository.getAccountById(id);

  Stream<BaseAccount> watchById(int id) => 
      _accountRepository.watchAccountById(id);

  Stream<List<AccountBalanceView>> watchBalances() =>
      _balanceService.watchAllBalance();

  Future<BaseAccount> insert({
    required String title,
    required bool isDebt,
    required int? userId,
  }) async {
    final account = switch (isDebt) {
      true => Debt(title: title, userId: userId),
      false => Account(title: title, userId: userId),
    };

    final id = await _accountRepository.insertAccount(account);
    return account.copyWith(id: id);
  }

  Future<BaseAccount> update({
    required BaseAccount account,
    required String title,
    required int? userId,
  }) async {
    final newAccount = account.copyWith(title: title).setUser(userId);
    await _accountRepository.updateAccount(newAccount);
    return newAccount;
  }
}
```

---

## Фаза 2: Обработка ошибок - Детализация

### Шаг 2.1.1: Расширение Result типа

**Файл:** `lib/src/domain/models/result.dart`

```dart
sealed class Result<T> {
  Result();

  factory Result.success(T result) => _Success<T>(result);
  factory Result.failure(Exception exception) => _Failure<T>(exception);

  bool get isSuccess => this is _Success<T>;
  bool get isFailure => this is _Failure<T>;

  T getOrThrow() {
    return switch (this) {
      _Success<T>(:final result) => result,
      _Failure<T>(:final exception) => throw exception,
    };
  }

  T getOrElse(T Function() defaultValue) {
    return switch (this) {
      _Success<T>(:final result) => result,
      _Failure<T>() => defaultValue(),
    };
  }

  P fold<P>({
    required P Function(T result) onSuccess,
    required P Function(Exception exception) onFailure,
  }) {
    return switch (this) {
      _Success<T>(:final result) => onSuccess(result),
      _Failure<T>(:final exception) => onFailure(exception),
    };
  }

  P map<P>({
    required P Function(T result) onSuccess,
    required P Function(Exception exception) onFailure,
  }) {
    return fold(onSuccess: onSuccess, onFailure: onFailure);
  }
}

class _Success<T> extends Result<T> {
  final T result;
  _Success(this.result);
}

class _Failure<T> extends Result<T> {
  final Exception exception;
  _Failure(this.exception);
}
```

### Шаг 2.1.2: Extension для Future<Result<T>>

**Файл:** `lib/src/domain/models/result_extensions.dart`

```dart
import 'result.dart';

extension FutureResultExtension<T> on Future<Result<T>> {
  Future<Result<P>> map<P>(P Function(T) mapper) async {
    final result = await this;
    return result.map(
      onSuccess: (value) => Result.success(mapper(value)),
      onFailure: (exception) => Result.failure(exception),
    );
  }

  Future<Result<T>> onError(Function(Exception) handler) async {
    final result = await this;
    if (result.isFailure) {
      handler((result as _Failure<T>).exception);
    }
    return result;
  }
}
```

### Шаг 2.2.1: Расширение исключений

**Файл:** `lib/src/utils/exceptions.dart`

```dart
// Базовые исключения
abstract class AppException implements Exception {
  final String message;
  final Object? originalError;
  
  AppException(this.message, [this.originalError]);
  
  @override
  String toString() => message;
}

// Data слой исключения
class DataException extends AppException {
  DataException(super.message, [super.originalError]);
}

class DatabaseException extends DataException {
  DatabaseException(super.message, [super.originalError]);
}

class MappingException extends DataException {
  MappingException(super.message, [super.originalError]);
}

class ValidationException extends DataException {
  ValidationException(super.message, [super.originalError]);
}

// Network исключения
class NetworkException extends AppException {
  NetworkException(super.message, [super.originalError]);
}

class ConnectionException extends NetworkException {
  ConnectionException([super.originalError]) 
      : super('No internet connection');
}

class TimeoutException extends NetworkException {
  TimeoutException([super.originalError]) 
      : super('Request timeout');
}

// Auth исключения
class AuthException extends AppException {
  AuthException(super.message, [super.originalError]);
}

class UnauthorizedException extends AuthException {
  UnauthorizedException([super.originalError]) 
      : super('User is not authorized');
}

class AuthenticationFailedException extends AuthException {
  AuthenticationFailedException([super.originalError]) 
      : super('Authentication failed');
}

// Sync исключения
class SyncException extends AppException {
  SyncException(super.message, [super.originalError]);
}

class ConflictException extends SyncException {
  ConflictException(super.message, [super.originalError]);
}

class SyncFailedException extends SyncException {
  SyncFailedException([super.originalError]) 
      : super('Synchronization failed');
}

class NoRemoteDBException implements Exception {
  @override
  String toString() => 'No remote database';
}
```

### Шаг 2.3.1: Обновление AccountInteractor с Result

**Файл:** `lib/src/domain/interactors/account_interactor.dart`

```dart
import '../interfaces/account_repository.dart';
import '../models/account/account.dart';
import '../models/result.dart';
import '../services/balance_service.dart';
import '../view_models/account_balance_view.dart';
import '../../utils/exceptions.dart';
import '../../utils/logger.dart';

class AccountInteractor {
  final AccountRepository _accountRepository;
  final BalanceService _balanceService;

  AccountInteractor(
    this._accountRepository,
    this._balanceService,
  );

  Future<Result<BaseAccount>> getById(int id) async {
    try {
      final account = await _accountRepository.getAccountById(id);
      return Result.success(account);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to get account by id: $id', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to get account', e),
      );
    }
  }

  Stream<BaseAccount> watchById(int id) => 
      _accountRepository.watchAccountById(id);

  Stream<List<AccountBalanceView>> watchBalances() =>
      _balanceService.watchAllBalance();

  Future<Result<BaseAccount>> insert({
    required String title,
    required bool isDebt,
    required int? userId,
  }) async {
    try {
      final account = switch (isDebt) {
        true => Debt(title: title, userId: userId),
        false => Account(title: title, userId: userId),
      };

      final id = await _accountRepository.insertAccount(account);
      return Result.success(account.copyWith(id: id));
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to insert account', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to insert account', e),
      );
    }
  }

  Future<Result<BaseAccount>> update({
    required BaseAccount account,
    required String title,
    required int? userId,
  }) async {
    try {
      final newAccount = account.copyWith(title: title).setUser(userId);
      await _accountRepository.updateAccount(newAccount);
      return Result.success(newAccount);
    } on Exception catch (e, stackTrace) {
      AppLogger.error('Failed to update account', e, stackTrace);
      return Result.failure(
        DatabaseException('Failed to update account', e),
      );
    }
  }
}
```

### Шаг 2.4.1: Обновление AccountInputBloc с обработкой ошибок

**Файл:** `lib/src/ui/pages/account/input_page/account_input_bloc.dart`

```dart
// В AccountInputState добавить:
@freezed
abstract class AccountInputState with _$AccountInputState {
  const factory AccountInputState.initial() = _Initial;
  const factory AccountInputState.loading() = _Loading;
  const factory AccountInputState.success(BaseAccount account) = _Success;
  const factory AccountInputState.error(String message) = _Error;
}

// В event handler:
on<SaveAccountEvent>((event, emit) async {
  emit(const AccountInputState.loading());
  
  final result = await _accountInteractor.insert(
    title: event.title,
    isDebt: event.isDebt,
    userId: event.userId,
  );
  
  result.fold(
    onSuccess: (account) => emit(AccountInputState.success(account)),
    onFailure: (exception) => emit(
      AccountInputState.error(exception.toString()),
    ),
  );
});
```

---

## Фаза 3: DI модули - Детализация

### Шаг 3.1.1: Создание core_module.dart

**Файл:** `lib/src/injection/core_module.dart`

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/sources/local/data/database.dart';

void registerCoreModule(GetIt sl) async {
  // Database
  sl.registerLazySingleton<Database>(() => Database());

  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // Firebase
  sl.registerLazySingleton<FirebaseFirestore>(() {
    final firestore = FirebaseFirestore.instance;
    firestore.settings = const Settings(persistenceEnabled: false);
    return firestore;
  });

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Google Sign In
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/drive',
        ],
      ));

  // Connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}
```

### Шаг 3.1.2: Создание data_module.dart

**Файл:** `lib/src/injection/data_module.dart`

```dart
import 'package:get_it/get_it.dart';

import '../../data/repositories/account_repository_impl.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../data/repositories/operation_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/repositories/currency_repository_impl.dart';
import '../../data/services/balance_service_impl.dart';
import '../../data/services/cashflow_service_impl.dart';
import '../../data/services/operation_view_service_impl.dart';
import '../../data/sources/local/data/account_dao.dart';
import '../../data/sources/local/data/category_dao.dart';
import '../../data/sources/local/data/operation_dao.dart';
import '../../data/sources/local/data/user_dao.dart';
import '../../data/sources/currency_rate_source.dart';
import '../../data/sources/settings_source_impl.dart';
import '../../domain/interfaces/account_repository.dart';
import '../../domain/interfaces/category_repository.dart';
import '../../domain/interfaces/operation_repository.dart';
import '../../domain/interfaces/user_repository.dart';
import '../../domain/interfaces/currency_repository.dart';
import '../../domain/services/balance_service.dart';
import '../../domain/services/cashflow_service.dart';
import '../../domain/services/operation_view_service.dart';

void registerDataModule(GetIt sl) {
  // DAOs
  sl.registerLazySingleton<AccountDao>(() => AccountDao(sl()));
  sl.registerLazySingleton<CategoryDao>(() => CategoryDao(sl()));
  sl.registerLazySingleton<OperationDao>(() => OperationDao(sl()));
  sl.registerLazySingleton<UserDao>(() => UserDao(sl()));

  // Sources
  sl.registerLazySingleton<SettingsSource>(
      () => SettingsSourceImpl(sl<SharedPreferences>()));

  // Repositories
  sl.registerLazySingleton<AccountRepository>(
      () => AccountRepositoryImpl(sl<AccountDao>()));
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl<CategoryDao>()));
  sl.registerLazySingleton<OperationRepository>(
      () => OperationRepositoryImpl(sl<OperationDao>()));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl<UserDao>()));
  sl.registerLazySingleton<CurrencyRepository>(
      () => CurrencyRepositoryImpl(
            CurrencyRateSource(settingsSource: sl()),
          ));

  // Services
  sl.registerLazySingleton<BalanceService>(
      () => BalanceServiceImpl(
            accountRepository: sl(),
            userRepository: sl(),
            accountDao: sl(),
            userDao: sl(),
          ));

  sl.registerLazySingleton<CashflowService>(
      () => CashflowServiceImpl(
            categoryRepository: sl(),
            categoryDao: sl(),
          ));

  sl.registerLazySingleton<OperationViewService>(
      () => OperationViewServiceImpl(
            operationRepository: sl(),
            userRepository: sl(),
            operationDao: sl(),
            userDao: sl(),
          ));

  // Legacy DataRepository (deprecated, for backward compatibility)
  sl.registerLazySingleton<DataRepository>(
      () => DataRepositoryImpl(
            accountRepository: sl(),
            categoryRepository: sl(),
            operationRepository: sl(),
            userRepository: sl(),
            currencyRepository: sl(),
            balanceService: sl(),
            cashflowService: sl(),
            operationViewService: sl(),
          ));
}
```

---

## Фаза 5: Синхронизация - Детализация

### Шаг 5.1.1: Создание AccountSyncService

**Файл:** `lib/src/domain/services/sync/account_sync_service.dart`

```dart
import '../../models/account/account.dart';

abstract class AccountSyncService {
  Future<void> syncToRemote(List<BaseAccount> accounts);
  Future<List<BaseAccount>> syncFromRemote(DateTime date);
  Future<void> resolveConflict(
    BaseAccount local,
    BaseAccount remote,
  );
}
```

### Шаг 5.1.2: Создание ConflictResolver

**Файл:** `lib/src/domain/services/sync/conflict_resolver.dart`

```dart
import '../../models/account/account.dart';

abstract class ConflictResolver<T> {
  T resolve(T local, T remote);
}

class LastWriteWinsResolver<T> implements ConflictResolver<T> {
  @override
  T resolve(T local, T remote) {
    // Простая стратегия: выбираем remote (последняя запись)
    return remote;
  }
}
```

---

## Фаза 8: Тестирование - Детализация

### Шаг 8.2.1: Тест для AccountInteractor

**Файл:** `test/domain/interactors/account_interactor_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_tracker/src/domain/interactors/account_interactor.dart';
import 'package:money_tracker/src/domain/interfaces/account_repository.dart';
import 'package:money_tracker/src/domain/models/account/account.dart';
import 'package:money_tracker/src/domain/services/balance_service.dart';

import 'account_interactor_test.mocks.dart';

@GenerateMocks([AccountRepository, BalanceService])
void main() {
  late AccountInteractor interactor;
  late MockAccountRepository mockRepository;
  late MockBalanceService mockBalanceService;

  setUp(() {
    mockRepository = MockAccountRepository();
    mockBalanceService = MockBalanceService();
    interactor = AccountInteractor(mockRepository, mockBalanceService);
  });

  group('getById', () {
    test('should return account when repository succeeds', () async {
      // Arrange
      const account = Account(id: 1, title: 'Test Account');
      when(mockRepository.getAccountById(1))
          .thenAnswer((_) async => account);

      // Act
      final result = await interactor.getById(1);

      // Assert
      expect(result.isSuccess, true);
      expect(result.getOrThrow(), account);
      verify(mockRepository.getAccountById(1)).called(1);
    });

    test('should return failure when repository throws', () async {
      // Arrange
      when(mockRepository.getAccountById(1))
          .thenThrow(Exception('Database error'));

      // Act
      final result = await interactor.getById(1);

      // Assert
      expect(result.isFailure, true);
    });
  });

  group('insert', () {
    test('should insert and return account with id', () async {
      // Arrange
      const account = Account(id: 0, title: 'New Account');
      when(mockRepository.insertAccount(any))
          .thenAnswer((_) async => 1);

      // Act
      final result = await interactor.insert(
        title: 'New Account',
        isDebt: false,
        userId: null,
      );

      // Assert
      expect(result.isSuccess, true);
      final insertedAccount = result.getOrThrow();
      expect(insertedAccount.id, 1);
      expect(insertedAccount.title, 'New Account');
    });
  });
}
```

---

## Чеклист выполнения

### Фаза 1: Репозитории
- [ ] Создать интерфейсы репозиториев (5 файлов)
- [ ] Создать интерфейсы сервисов (3 файла)
- [ ] Создать реализации репозиториев (5 файлов)
- [ ] Создать реализации сервисов (3 файла)
- [ ] Обновить DataRepository (deprecated)
- [ ] Обновить все Interactors (5 файлов)
- [ ] Обновить injection_container.dart

### Фаза 2: Ошибки
- [ ] Расширить Result тип
- [ ] Создать result_extensions.dart
- [ ] Расширить exceptions.dart
- [ ] Создать logger.dart
- [ ] Обновить все Interactors (5 файлов)
- [ ] Обновить все BLoC (15+ файлов)
- [ ] Обновить db_mapper.dart

### Фаза 3: DI
- [ ] Создать core_module.dart
- [ ] Создать data_module.dart
- [ ] Создать domain_module.dart
- [ ] Создать ui_module.dart
- [ ] Обновить injection_container.dart
- [ ] Убрать sl из UI (проверить все файлы)

### Фаза 4: BLoC
- [ ] Обновить user_bloc.dart
- [ ] Обновить category_cashflow_bloc.dart
- [ ] Создать base_bloc.dart
- [ ] Создать base_state.dart
- [ ] Обновить существующие BLoC

### Фаза 5: Синхронизация
- [ ] Создать sync сервисы (3 файла)
- [ ] Создать conflict_resolver.dart
- [ ] Обновить sync_repository_impl.dart
- [ ] Исправить баг с синхронизацией счетов

### Фаза 6: Навигация
- [ ] Создать app_router.dart
- [ ] Обновить app.dart
- [ ] Добавить валидацию параметров

### Фаза 7: Локализация
- [ ] Найти все TODO loc (grep)
- [ ] Добавить ключи в .arb файлы
- [ ] Заменить хардкод (10+ файлов)

### Фаза 8: Тестирование
- [ ] Тесты репозиториев (4 файла)
- [ ] Тесты interactors (5 файлов)
- [ ] Тесты BLoC (5+ файлов)
- [ ] Интеграционные тесты (2 файла)

### Фаза 9: Производительность
- [ ] Оптимизировать Stream подписки
- [ ] Добавить кэширование валют
- [ ] Оптимизировать combineLatest

### Фаза 10: Очистка
- [ ] Удалить закомментированный код
- [ ] Унифицировать freezed
- [ ] Обновить ARCH
- [ ] Создать ARCHITECTURE.md


# План улучшения архитектуры приложения

## Фаза 1: Рефакторинг репозиториев (Приоритет: ВЫСОКИЙ)

### Шаг 1.1: Разделение DataRepository на специализированные репозитории

**Цель:** Разбить монолитный `DataRepository` на отдельные репозитории по доменам.

#### 1.1.1 Создать интерфейсы специализированных репозиториев

**Создать файлы:**
- `lib/src/domain/interfaces/account_repository.dart`
  - Методы: `watchAllAccounts()`, `getAllAccounts()`, `watchAccountById()`, `getAccountById()`, `insertAccount()`, `updateAccount()`
  
- `lib/src/domain/interfaces/category_repository.dart`
  - Методы: `watchAllCategories()`, `getAllCategories()`, `getCategoryById()`, `watchCategoryById()`, `insertCategory()`, `updateCategory()`
  
- `lib/src/domain/interfaces/operation_repository.dart`
  - Методы: `getAllOperations()`, `watchAllOperations()`, `getOperationById()`, `insertOperation()`, `updateOperation()`, `deleteOperationById()`, `recoverOperation()`, `duplicateOperation()`, `getAllOperationsWithEmptyCloudId()`
  
- `lib/src/domain/interfaces/user_repository.dart`
  - Методы: `getUserByGoogleId()`, `insertUser()`, `getAllUsers()`
  
- `lib/src/domain/interfaces/currency_repository.dart`
  - Методы: `usdRate()`, `eurRate()`

#### 1.1.2 Создать сервисы для агрегации данных

**Создать файлы:**
- `lib/src/domain/services/balance_service.dart`
  - Методы: `watchAllBalance()`, `getAllBalance()`
  - Зависимости: `AccountRepository`, `UserRepository`, `AccountDao` (для балансов)
  
- `lib/src/domain/services/cashflow_service.dart`
  - Методы: `watchCashFlow()`, `watchCashFlowByType()`, `watchCashFlowByCategoryByMonth()`, `watchCashFlowByCategoryByYear()`
  - Зависимости: `CategoryRepository`, `CategoryDao` (для cashflow)

- `lib/src/domain/services/operation_view_service.dart`
  - Методы: `watchAllOperationsByFilter()`, `watchAllOperationsByAccount()`, `watchAllOperationsByCategory()`, `watchLastOperations()`
  - Зависимости: `OperationRepository`, `UserRepository`

#### 1.1.3 Создать реализации репозиториев

**Создать файлы:**
- `lib/src/data/repositories/account_repository_impl.dart`
  - Реализует `AccountRepository`
  - Использует `AccountDao` и `AccountMapper`
  
- `lib/src/data/repositories/category_repository_impl.dart`
  - Реализует `CategoryRepository`
  - Использует `CategoryDao` и `CategoryMapper`
  
- `lib/src/data/repositories/operation_repository_impl.dart`
  - Реализует `OperationRepository`
  - Использует `OperationDao` и `OperationMapper`
  
- `lib/src/data/repositories/user_repository_impl.dart`
  - Реализует `UserRepository`
  - Использует `UserDao` и `UserMapper`
  
- `lib/src/data/repositories/currency_repository_impl.dart`
  - Реализует `CurrencyRepository`
  - Использует `CurrencyRateSource`

#### 1.1.4 Создать реализации сервисов

**Создать файлы:**
- `lib/src/data/services/balance_service_impl.dart`
  - Реализует `BalanceService`
  - Переносит логику из `AccountMapper.combineBalances()`
  
- `lib/src/data/services/cashflow_service_impl.dart`
  - Реализует `CashflowService`
  - Переносит логику из `CategoryMapper.combineCashFlow()`
  
- `lib/src/data/services/operation_view_service_impl.dart`
  - Реализует `OperationViewService`
  - Переносит логику из `DataRepositoryImpl` для операций с view моделями

#### 1.1.5 Обновить DataRepository (deprecated)

**Изменить файл:**
- `lib/src/domain/interfaces/data_repository.dart`
  - Добавить `@Deprecated` ко всем методам
  - Оставить как фасад для обратной совместимости
  - Реализация будет делегировать вызовы новым репозиториям

**Изменить файл:**
- `lib/src/data/repositories/data_repository_impl.dart`
  - Переписать как фасад, делегирующий вызовы новым репозиториям и сервисам
  - Сохранить для обратной совместимости

#### 1.1.6 Обновить Interactors

**Изменить файлы:**
- `lib/src/domain/interactors/account_interactor.dart`
  - Заменить `DataRepository` на `AccountRepository` и `BalanceService`
  
- `lib/src/domain/interactors/category_interactor.dart`
  - Заменить `DataRepository` на `CategoryRepository` и `CashflowService`
  
- `lib/src/domain/interactors/operation_interactor.dart`
  - Заменить `DataRepository` на `OperationRepository` и `OperationViewService`
  
- `lib/src/domain/interactors/user_interactor.dart`
  - Заменить `DataRepository` на `UserRepository`
  
- `lib/src/domain/interactors/currency_interactor.dart`
  - Заменить `DataRepository` на `CurrencyRepository`

#### 1.1.7 Обновить DI контейнер

**Изменить файл:**
- `lib/src/injection_container.dart`
  - Зарегистрировать новые репозитории и сервисы
  - Обновить регистрацию interactors с новыми зависимостями
  - Сохранить регистрацию старого `DataRepository` для обратной совместимости

---

## Фаза 2: Унификация обработки ошибок (Приоритет: ВЫСОКИЙ)

### Шаг 2.1: Расширение Result типа

**Изменить файл:**
- `lib/src/domain/models/result.dart`
  - Добавить методы: `isSuccess`, `isFailure`, `getOrThrow()`, `getOrElse()`, `fold()`
  - Добавить extension для `Future<Result<T>>`

**Создать файл:**
- `lib/src/domain/models/result_extensions.dart`
  - Extension методы для работы с `Result` в async контексте

### Шаг 2.2: Типизированные исключения

**Изменить файл:**
- `lib/src/utils/exceptions.dart`
  - Расширить иерархию исключений:
    - `DataException` (базовый)
      - `DatabaseException`
      - `MappingException`
      - `ValidationException`
    - `NetworkException` (уже есть)
      - `ConnectionException`
      - `TimeoutException`
    - `AuthException` (уже есть)
      - `UnauthorizedException`
      - `AuthenticationFailedException`
    - `SyncException`
      - `ConflictException`
      - `SyncFailedException`

### Шаг 2.3: Обновить Interactors для использования Result

**Изменить файлы:**
- `lib/src/domain/interactors/account_interactor.dart`
  - Все методы возвращают `Future<Result<T>>`
  - Оборачивать исключения в `Result.failure()`
  
- `lib/src/domain/interactors/category_interactor.dart`
  - Аналогично
  
- `lib/src/domain/interactors/operation_interactor.dart`
  - Аналогично
  
- `lib/src/domain/interactors/user_interactor.dart`
  - Аналогично
  
- `lib/src/domain/interactors/currency_interactor.dart`
  - Аналогично

### Шаг 2.4: Обновить BLoC для обработки ошибок

**Изменить файлы:**
- `lib/src/ui/blocs/account_balance_bloc.dart`
  - Добавить состояния ошибок в `AccountBalanceState`
  - Обрабатывать `Result.failure` в event handlers
  
- `lib/src/ui/blocs/category_cashflow_bloc.dart`
  - Аналогично
  
- `lib/src/ui/blocs/currency_rate_bloc.dart`
  - Аналогично
  
- `lib/src/ui/blocs/user_bloc.dart`
  - Аналогично

**Изменить все BLoC в:**
- `lib/src/ui/pages/account/input_page/account_input_bloc.dart`
- `lib/src/ui/pages/account/detail_page/account_detail_bloc.dart`
- `lib/src/ui/pages/category/input_page/category_input_bloc.dart`
- `lib/src/ui/pages/category/detail_page/category_detail_bloc.dart`
- `lib/src/ui/pages/operation/input_page/operation_input_bloc.dart`
- `lib/src/ui/pages/operation/edit_page/operation_edit_bloc.dart`
- `lib/src/ui/pages/operation/list_page/operation_list_bloc.dart`
- `lib/src/ui/pages/budget_page/budget_bloc.dart`
- И другие...

### Шаг 2.5: Централизованное логирование

**Создать файл:**
- `lib/src/utils/logger.dart`
  - Класс `AppLogger` с методами: `debug()`, `info()`, `warning()`, `error()`
  - Использовать `debugPrint` в debug режиме, `FirebaseCrashlytics` в production

**Изменить файл:**
- `lib/src/data/sources/local/db_mapper.dart`
  - Заменить `print()` на `AppLogger.error()`
  - Улучшить обработку ошибок в `combineBalances()`

---

## Фаза 3: Рефакторинг Dependency Injection (Приоритет: СРЕДНИЙ)

### Шаг 3.1: Разделение DI на модули

**Создать файлы:**
- `lib/src/injection/data_module.dart`
  - Регистрация всех data-слой зависимостей (DAOs, источники данных, репозитории)
  
- `lib/src/injection/domain_module.dart`
  - Регистрация interactors и сервисов
  
- `lib/src/injection/ui_module.dart`
  - Регистрация BLoC (только фабрики, синглтоны остаются в main)
  
- `lib/src/injection/core_module.dart`
  - Регистрация базовых зависимостей (Database, SharedPreferences, Firebase, etc.)

**Изменить файл:**
- `lib/src/injection_container.dart`
  - Импортировать модули и вызывать их функции регистрации
  - Упростить структуру

### Шаг 3.2: Убрать прямые обращения к sl из UI

**Изменить файлы:**
- `lib/src/ui/pages/category/detail_page/category_cashflow_diagram.dart`
  - Убрать `sl<DataRepository>()`
  - Передавать зависимости через конструктор или использовать BLoC

**Проверить все файлы в `lib/src/ui/` на наличие `sl<...>()`**

---

## Фаза 4: Улучшение BLoC архитектуры (Приоритет: СРЕДНИЙ)

### Шаг 4.1: Унификация жизненного цикла BLoC

**Изменить файл:**
- `lib/src/ui/blocs/user_bloc.dart`
  - Убрать загрузку данных из конструктора
  - Добавить событие `LoadUsersEvent`
  - Загружать данные при первом событии

### Шаг 4.2: Коммуникация между BLoC через события

**Изменить файл:**
- `lib/src/ui/blocs/category_cashflow_bloc.dart`
  - Убрать прямую зависимость от `CurrencyRateBloc`
  - Подписываться на события через `BlocListener` или использовать общий сервис

### Шаг 4.3: Добавить базовые классы для BLoC

**Создать файлы:**
- `lib/src/ui/blocs/base_bloc.dart`
  - Базовый класс с общими методами обработки ошибок
  
- `lib/src/ui/blocs/base_state.dart`
  - Базовые состояния: `Initial`, `Loading`, `Success`, `Error`

**Обновить существующие BLoC:**
- Использовать базовые классы где возможно
- Унифицировать структуру состояний

---

## Фаза 5: Рефакторинг синхронизации (Приоритет: ВЫСОКИЙ)

### Шаг 5.1: Разделение SyncRepository на сервисы

**Создать файлы:**
- `lib/src/domain/services/sync/account_sync_service.dart`
  - Интерфейс для синхронизации счетов
  
- `lib/src/domain/services/sync/category_sync_service.dart`
  - Интерфейс для синхронизации категорий
  
- `lib/src/domain/services/sync/operation_sync_service.dart`
  - Интерфейс для синхронизации операций
  
- `lib/src/domain/services/sync/conflict_resolver.dart`
  - Интерфейс для разрешения конфликтов

**Создать реализации:**
- `lib/src/data/services/sync/account_sync_service_impl.dart`
- `lib/src/data/services/sync/category_sync_service_impl.dart`
- `lib/src/data/services/sync/operation_sync_service_impl.dart`
- `lib/src/data/services/sync/last_write_wins_resolver.dart` (или другая стратегия)

### Шаг 5.2: Упростить SyncRepository

**Изменить файл:**
- `lib/src/data/repositories/sync_repository_impl.dart`
  - Использовать новые сервисы синхронизации
  - Уменьшить размер файла
  - Добавить транзакционность для критических операций

### Шаг 5.3: Исправить проблему с синхронизацией новых счетов

**Изменить файл:**
- `lib/src/data/repositories/sync_repository_impl.dart`
  - Исправить TODO на строке 383
  - Обеспечить правильный порядок синхронизации (сначала счета, потом операции)

---

## Фаза 6: Улучшение навигации (Приоритет: НИЗКИЙ)

### Шаг 6.1: Вынести роутинг в отдельный файл

**Создать файл:**
- `lib/src/ui/navigation/app_router.dart`
  - Перенести определение `_router` из `app.dart`
  - Перенести класс `Pages` из `app.dart`
  - Добавить типизированные параметры роутинга

**Изменить файл:**
- `lib/src/ui/app.dart`
  - Импортировать роутер из `app_router.dart`
  - Оставить только `MyApp` widget

### Шаг 6.2: Валидация параметров роутинга

**Изменить файл:**
- `lib/src/ui/navigation/app_router.dart`
  - Добавить валидацию параметров в builder-функциях
  - Обрабатывать ошибки парсинга

---

## Фаза 7: Локализация (Приоритет: СРЕДНИЙ)

### Шаг 7.1: Найти все нелокализованные строки

**Использовать grep для поиска:**
- Все строки с комментарием `// TODO loc`
- Все хардкод строки в UI

### Шаг 7.2: Добавить переводы

**Изменить файлы:**
- `lib/src/l10n/app_en.arb`
- `lib/src/l10n/app_ru.arb`
  - Добавить все недостающие ключи

### Шаг 7.3: Заменить хардкод на локализацию

**Изменить файлы:**
- `lib/src/ui/pages/home/home_page_cards/cashflow_card.dart`
- `lib/src/ui/pages/home/home_page_cards/totals_card.dart`
- `lib/src/ui/pages/budget_page/budget_page.dart`
- `lib/src/ui/pages/account/list_page/account_list_page.dart`
- `lib/src/ui/pages/account/input_page/account_input_page.dart`
- `lib/src/ui/pages/category/list_page/category_groups_list_page.dart`
- И другие файлы с TODO loc

---

## Фаза 8: Тестирование (Приоритет: ВЫСОКИЙ)

### Шаг 8.1: Unit тесты для репозиториев

**Создать файлы:**
- `test/data/repositories/account_repository_impl_test.dart`
- `test/data/repositories/category_repository_impl_test.dart`
- `test/data/repositories/operation_repository_impl_test.dart`
- `test/data/repositories/user_repository_impl_test.dart`

### Шаг 8.2: Unit тесты для interactors

**Создать файлы:**
- `test/domain/interactors/account_interactor_test.dart`
- `test/domain/interactors/category_interactor_test.dart`
- `test/domain/interactors/operation_interactor_test.dart`
- `test/domain/interactors/user_interactor_test.dart`

### Шаг 8.3: BLoC тесты

**Создать файлы:**
- `test/ui/blocs/account_balance_bloc_test.dart`
- `test/ui/blocs/user_bloc_test.dart`
- `test/ui/pages/account/input_page/account_input_bloc_test.dart`
- И другие ключевые BLoC

### Шаг 8.4: Интеграционные тесты

**Создать файлы:**
- `test/integration/sync_test.dart`
- `test/integration/operation_flow_test.dart`

---

## Фаза 9: Оптимизация производительности (Приоритет: НИЗКИЙ)

### Шаг 9.1: Оптимизация Stream подписок

**Изменить файлы:**
- `lib/src/data/repositories/account_repository_impl.dart`
  - Добавить `shareReplay()` для часто используемых streams
  
- `lib/src/data/repositories/category_repository_impl.dart`
  - Аналогично
  
- `lib/src/data/repositories/operation_repository_impl.dart`
  - Аналогично

### Шаг 9.2: Кэширование курсов валют

**Изменить файл:**
- `lib/src/data/repositories/currency_repository_impl.dart`
  - Добавить кэширование с TTL (например, 1 час)
  - Использовать `SharedPreferences` для хранения кэша

### Шаг 9.3: Оптимизация combineLatest

**Изменить файлы:**
- `lib/src/data/services/balance_service_impl.dart`
  - Использовать `distinct()` для избежания лишних эмиссий
  
- `lib/src/data/services/cashflow_service_impl.dart`
  - Аналогично

---

## Фаза 10: Очистка кода (Приоритет: НИЗКИЙ)

### Шаг 10.1: Удалить закомментированный код

**Проверить все файлы:**
- Удалить закомментированные блоки кода
- Перенести важные комментарии в документацию

### Шаг 10.2: Унифицировать использование freezed

**Проверить все BLoC:**
- Убедиться, что все события и состояния используют `@freezed`
- Добавить где необходимо

### Шаг 10.3: Обновить документацию

**Изменить файл:**
- `ARCH`
  - Обновить описание архитектуры
  - Удалить устаревшую информацию
  - Добавить описание новых компонентов

**Создать файл:**
- `ARCHITECTURE.md`
  - Детальное описание архитектуры
  - Диаграммы зависимостей
  - Описание потоков данных

---

## Порядок выполнения

### Первая итерация (Критично)
1. Фаза 1: Рефакторинг репозиториев
2. Фаза 2: Унификация обработки ошибок
3. Фаза 5: Рефакторинг синхронизации (шаг 5.3 - исправление бага)

### Вторая итерация (Важно)
4. Фаза 3: Рефакторинг DI
5. Фаза 4: Улучшение BLoC архитектуры
6. Фаза 8: Тестирование (базовое покрытие)

### Третья итерация (Улучшения)
7. Фаза 7: Локализация
8. Фаза 6: Улучшение навигации
9. Фаза 9: Оптимизация производительности
10. Фаза 10: Очистка кода

---

## Метрики успеха

- Уменьшение размера `DataRepository` с 85+ методов до 0 (deprecated)
- Уменьшение размера `SyncRepositoryImpl` с 550+ строк до <200 строк
- Уменьшение размера `injection_container.dart` с 218 строк до <100 строк
- Покрытие тестами: минимум 60% для domain и data слоев
- Все BLoC имеют обработку ошибок
- Все строки локализованы
- Нет прямых обращений к `sl` из UI слоя


// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get helloWorld => 'Привет';

  @override
  String get title => 'Имя';

  @override
  String get titleType => 'Тип';

  @override
  String get titleBudget => 'Бюджет';

  @override
  String get titleFact => 'Факт';

  @override
  String get titleDate => 'Дата';

  @override
  String get titleAccount => 'Счет';

  @override
  String get titleCategory => 'Категория';

  @override
  String get titleAnalytic => 'Аналитика';

  @override
  String get titleSum => 'Сумма';

  @override
  String get titleTotalSum => 'Итого';

  @override
  String get titleMaster => 'Мастер ввода';

  @override
  String get titleTotalBalance => 'Общий итог';

  @override
  String get titleCashflow => 'Денежный поток';

  @override
  String get titleLastOperations => 'Последние операции';

  @override
  String get titleDataControl => 'Управление данными';

  @override
  String get titleReports => 'Отчеты';

  @override
  String get titleFilters => 'Отборы';

  @override
  String get titleMonthBudgets => 'По месяцам';

  @override
  String get titleYearBudgets => 'Годовые';

  @override
  String get emptyTitleError => 'Введите имя';

  @override
  String get emptyBudgetError => 'Введите бюджет';

  @override
  String get emptyAccountError => 'Выберите счет';

  @override
  String get emptyCategoryError => 'Выберите категорию';

  @override
  String get emptyRecAccountError => 'Выберите счет-приемник';

  @override
  String get emptySumError => 'Введите сумму';

  @override
  String get errorNoGpServices => 'Нет google play сервисов';

  @override
  String get typeInput => 'Приход';

  @override
  String get typeOutput => 'Расход';

  @override
  String get typeTransfer => 'Перевод';

  @override
  String get typeExchange => 'Обмен';

  @override
  String get budgetTypeMonth => 'Месяц';

  @override
  String get budgetTypeYear => 'Год';

  @override
  String get accountCardTitle => 'Счет';

  @override
  String get debtCardTitle => 'Долг';

  @override
  String get categoryCardTitle => 'Категория';

  @override
  String get categoryGroupCardTitle => 'Группа';

  @override
  String get operationCardTitle => 'Операция';

  @override
  String get newAccountCardTitle => 'Новый счет';

  @override
  String get newDebtCardTitle => 'Новый долг';

  @override
  String get newCategoryCardTitle => 'Новая категория';

  @override
  String get newCategoryGroupCardTitle => 'Новая группа';

  @override
  String get newOperationCardTitle => 'Новая операция';

  @override
  String get hintAccount => 'Выберите счет';

  @override
  String get hintCategory => 'Выберите категорию';

  @override
  String get hintEmptyList => 'Нажмите кнопку для добавления нового';

  @override
  String get emptyListAccounts => 'Список счетов пуст';

  @override
  String get emptyListCategories => 'Список категорий пуст';

  @override
  String get emptyListOperations => 'Список операций пуст';

  @override
  String get emptyListBudgets => 'Список бюджетов пуст';

  @override
  String get mesOperationDeleted => 'Операция удалена';

  @override
  String get mesOperationCreated => 'Операция создана';

  @override
  String get mesOperationCanceled => 'Операция отменена';

  @override
  String get mesDatabaseBackuped => 'База данных сохранена';

  @override
  String get mesDatabaseRestored => 'База данных восстановлена';

  @override
  String get mesDatabaseDeleted => 'База данных удалена';

  @override
  String get mesAccountArchived => 'Счет добавлен в архив';

  @override
  String get mesCategoryArchived => 'Категория добавлена в архив';

  @override
  String get mesAreYouSure => 'Вы уверены?';

  @override
  String get owner => 'Владелец';

  @override
  String get noOwner => 'Нет владельца';

  @override
  String get details => 'Подробнее';

  @override
  String get accounts => 'Счета';

  @override
  String get account => 'Счет';

  @override
  String get debts => 'Долги';

  @override
  String get noItems => 'Нет элементов';

  @override
  String get noAccounts => 'Нет счетов';

  @override
  String get categories => 'Категории';

  @override
  String get category => 'Категория';

  @override
  String get noCategories => 'Нет категорий';

  @override
  String get operations => 'Операции';

  @override
  String get operationsIn => 'Операции за';

  @override
  String get noOperations => 'Нет операций';

  @override
  String get budget => 'Бюджет';

  @override
  String get budgets => 'Бюджеты';

  @override
  String get itemMenuService => 'Сервис';

  @override
  String get itemBarMain => 'Главная';

  @override
  String get period => 'Период';

  @override
  String get lastChanges => 'Последние изменения';

  @override
  String get choosePeriod => 'Выберите период';

  @override
  String get chooseAccount => 'Выберите счет';

  @override
  String get chooseCategory => 'Выберите категорию';

  @override
  String get inputCategory => 'Категория прихода';

  @override
  String get outputCategory => 'Категория расхода';

  @override
  String get earning => 'Получено';

  @override
  String get spending => 'Потрачено';

  @override
  String get topOfMonth => 'Топ месяца';

  @override
  String get topOfYear => 'Топ года';

  @override
  String earningIn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMM(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Получено за $dateString';
  }

  @override
  String spendingIn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMM(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Потрачено за $dateString';
  }

  @override
  String itemsCount(int count) {
    return '$count элементов';
  }

  @override
  String get budgetType => 'Тип бюджета';

  @override
  String get source => 'Источник';

  @override
  String get receiver => 'Приемник';

  @override
  String get yes => 'Да';

  @override
  String get cancel => 'Отмена';

  @override
  String get create => 'Создать';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get recover => 'Восстановить';

  @override
  String get duplicate => 'Дублировать';

  @override
  String get next => 'Далее';

  @override
  String get more => 'Еще';

  @override
  String get backup => 'Сохранить';

  @override
  String get restore => 'Восстановить';

  @override
  String get choose => 'Выбрать';

  @override
  String get archive => 'Архив';

  @override
  String get expand => 'Развернуть';

  @override
  String get collapse => 'Свернуть';

  @override
  String get apply => 'Применить';

  @override
  String get reset => 'Сбросить';

  @override
  String get inPeriod => 'за';

  @override
  String get btnAdd => 'Добавить';

  @override
  String get btnAddAccount => 'Добавить счет';

  @override
  String get btnShowAll => 'Показать все';

  @override
  String get btnHide => 'Скрыть';

  @override
  String get btnShowReports => 'Показать отчеты';

  @override
  String get btnDeleteAll => 'Удалить все';

  @override
  String get btnSync => 'Синхр';

  @override
  String get btnSaveAndContinue => 'Сохранить и продолжить';

  @override
  String get item => 'Элемент';

  @override
  String get group => 'Группа';

  @override
  String get users => 'Пользователи';

  @override
  String get other => 'Другое';

  @override
  String get syncStateInProgress => 'В процессе';

  @override
  String get syncStateSynced => 'Синхронизировано';

  @override
  String get syncStateLoadingToCloud => 'Загрузка в облако';

  @override
  String get syncStateLoadingFromCloud => 'Загрузка из облака';

  @override
  String get syncStateNoDB => 'Нет локальной базы';

  @override
  String get syncStateNotSynced => 'Не синхронизировано';

  @override
  String get syncStateFailure => 'Ошибка';
}

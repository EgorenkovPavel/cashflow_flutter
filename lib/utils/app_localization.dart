import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/domain/models.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String numberFormat(int number) {
    return NumberFormat.currency(
            locale: locale.languageCode, symbol: '', decimalDigits: 0)
        .format(number);
  }

  String operationTypeTitle(OperationType type) {
    switch (type) {
      case OperationType.INPUT:
        return _localizedValues[locale.languageCode]!['type_input']!;
      case OperationType.OUTPUT:
        return _localizedValues[locale.languageCode]!['type_output']!;
      case OperationType.TRANSFER:
        return _localizedValues[locale.languageCode]!['type_transfer']!;
      default: return '';
    }
  }

  String budgetTypeTitle(BudgetType type){
    switch(type){
      case BudgetType.MONTH:
        return _localizedValues[locale.languageCode]!['budget_type_month']!;
      case BudgetType.YEAR:
        return _localizedValues[locale.languageCode]!['budget_type_year']!;
    }
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Title',
      'title_type': 'Type',
      'title_budget': 'Budget',
      'title_fact': 'Fact',
      'title_date': 'Date',
      'title_account': 'Account',
      'title_category': 'Category',
      'title_analytic': 'Analytic',
      'title_sum': 'Sum',
      'title_total_sum': 'Total sum',
      'title_master': 'Operation master',
      'title_total_balance': 'Total balance',
      'title_cashflow': 'Cashflow',
      'title_last_operations': 'Last operations',
      'title_data_control': 'Data control',
      'title_reports': 'Reports',
      'title_filters': 'Filters',
      'title_month_budgets': 'Month budgets',
      'title_year_budgets': 'Year budgets',
      'empty_title_error': 'Enter title',
      'empty_budget_error': 'Enter budget',
      'empty_account_error': 'Choose account',
      'empty_category_error': 'Choose category',
      'empty_rec_account_error': 'Choose recipient account',
      'empty_sum_error': 'Enter sum',
      'error_no_gp_services': 'No google play services',
      'type_input': 'Input',
      'type_output': 'Output',
      'type_transfer': 'Transfer',
      'budget_type_month': 'Month',
      'budget_type_year': 'Year',
      'account_card_title': 'Account',
      'category_card_title': 'Category',
      'operation_card_title': 'Operation',
      'new_account_card_title': 'New account',
      'new_category_card_title': 'New category',
      'new_operation_card_title': 'New operation',
      'hint_account': 'Choose account',
      'hint_category': 'Choose category',
      'hint_empty_list': 'Press button to add first one',
      'empty_list_accounts': 'List of accounts is empty',
      'empty_list_categories': 'List of categories is empty',
      'empty_list_operations': 'List of operations is empty',
      'empty_list_budgets': 'List of budgets is empty',
      'mes_operation_deleted': 'Operation deleted',
      'mes_operation_created': 'Operation created',
      'mes_operation_canceled': 'Operation canceled',
      'mes_database_backuped': 'Database backuped',
      'mes_database_restored': 'Database restored',
      'mes_database_deleted': 'Database deleted',
      'mes_account_archived': 'Account archived',
      'mes_category_archived': 'Category archived',
      'mes_are_you_sure': 'Are you sure?',
      'accounts': 'Accounts',
      'no_accounts': 'No accounts',
      'categories': 'Categories',
      'no_categories': 'No categories',
      'operations': 'Operations',
      'operations_in': 'Operations in',
      'no_operations': 'No operations',
      'budget': 'Budget',
      'budgets': 'Budgets',
      'item_menu_service': 'Service',
      'item_bar_main': 'Main',
      'period': 'Period',
      'last_changes': 'Last changes',
      'choose_period': 'Choose period',
      'choose_account': 'Choose account',
      'choose_category': 'Choose category',
      'input_category': 'Input category',
      'output_category': 'Output category',
      'earning': 'Earning',
      'spending': 'Spending',
      'earning_in': 'Earning in',
      'spending_in': 'Spending in',
      'budget_type': 'Budget type',
      'source': 'Source',
      'receiver': 'Receiver',
      'yes': 'Yes',
      'cancel': 'Cancel',
      'create': 'Create',
      'save': 'Save',
      'delete': 'Delete',
      'duplicate': 'Duplicate',
      'next': 'Next',
      'more': 'More',
      'backup': 'Backup',
      'restore': 'Restore',
      'choose': 'Choose',
      'archive': 'Archive',
      'expand': 'Expand',
      'collapse': 'Collapse',
      'apply': 'Apply',
      'reset': 'Reset',
      'in': 'in',
      'btn_add_account': 'Add account',
      'btn_show_all': 'Show all',
      'btn_show_reports': 'Show reports',
      'btn_delete_all': 'Delete all',
    },
    'ru': {
      'title': 'Имя',
      'title_type': 'Тип',
      'title_budget': 'Бюджет',
      'title_fact': 'Факт',
      'title_date': 'Дата',
      'title_account': 'Счет',
      'title_category': 'Категория',
      'title_analytic': 'Аналитика',
      'title_sum': 'Сумма',
      'title_total_sum': 'Итого',
      'title_master': 'Мастер ввода',
      'title_total_balance': 'Общий итог',
      'title_cashflow': 'Денежный поток',
      'title_last_operations': 'Последние операции',
      'title_data_control': 'Управление данными',
      'title_reports': 'Отчеты',
      'title_filters': 'Отборы',
      'title_month_budgets': 'По месяцам',
      'title_year_budgets': 'Годовые',
      'empty_title_error': 'Введите имя',
      'empty_budget_error': 'Введите бюджет',
      'empty_account_error': 'Выберите счет',
      'empty_category_error': 'Выберите категорию',
      'empty_rec_account_error': 'Выберите счет-приемник',
      'empty_sum_error': 'Введите сумму',
      'error_no_gp_services': 'Нет google play сервисов',
      'type_input': 'Приход',
      'type_output': 'Расход',
      'type_transfer': 'Перевод',
      'budget_type_month': 'Месяц',
      'budget_type_year': 'Год',
      'account_card_title': 'Счет',
      'category_card_title': 'Категория',
      'operation_card_title': 'Операция',
      'new_account_card_title': 'Новый счет',
      'new_category_card_title': 'Новая категория',
      'new_operation_card_title': 'Новая операция',
      'hint_account': 'Выберите счет',
      'hint_category': 'Выберите категорию',
      'hint_empty_list': 'Нажмите кнопку для добавления нового',
      'empty_list_accounts': 'Список счетов пуст',
      'empty_list_categories': 'Список категорий пуст',
      'empty_list_operations': 'Список операций пуст',
      'empty_list_budgets': 'Список бюджетов пуст',
      'mes_operation_deleted': 'Операция удалена',
      'mes_operation_created': 'Операция создана',
      'mes_operation_canceled': 'Операция отменена',
      'mes_database_backuped': 'База данных сохранена',
      'mes_database_restored': 'База данных восстановлена',
      'mes_database_deleted': 'База данных удалена',
      'mes_account_archived': 'Счет добавлен в архив',
      'mes_category_archived': 'Категория добавлена в архив',
      'mes_are_you_sure': 'Вы уверены?',
      'accounts': 'Счета',
      'no_accounts': 'Нет счетов',
      'categories': 'Категории',
      'no_categories': 'Нет категорий',
      'operations': 'Операции',
      'operations_in': 'Операции за',
      'no_operations': 'Нет операций',
      'budget': 'Бюджет',
      'budgets': 'Бюджеты',
      'item_menu_service': 'Сервис',
      'item_bar_main': 'Главная',
      'period': 'Период',
      'last_changes': 'Последние изменения',
      'choose_period': 'Выберите период',
      'choose_account': 'Выберите счет',
      'choose_category': 'Выберите категорию',
      'input_category': 'Категория прихода',
      'output_category': 'Категория расхода',
      'earning': 'Получено',
      'spending': 'Потрачено',
      'earning_in': 'Получено за',
      'spending_in': 'Потрачено за',
      'budget_type': 'Тип бюджета',
      'source': 'Источник',
      'receiver': 'Приемник',
      'yes': 'Да',
      'cancel': 'Отмена',
      'create': 'Создать',
      'save': 'Сохранить',
      'delete': 'Удалить',
      'duplicate': 'Дублировать',
      'next': 'Далее',
      'more': 'Еще',
      'backup': 'Сохранить',
      'restore': 'Восстановить',
      'choose': 'Выбрать',
      'archive': 'Архив',
      'expand': 'Развернуть',
      'collapse': 'Свернуть',
      'apply': 'Применить',
      'reset': 'Сбросить',
      'in': 'за',
      'btn_add_account': 'Добавить счет',
      'btn_show_all': 'Показать все',
      'btn_show_reports': 'Показать отчеты',
      'btn_delete_all': 'Удалить все',
    },
  };

  String get title => _localizedValues[locale.languageCode]!['title']!;

  String get titleType => _localizedValues[locale.languageCode]!['title_type']!;

  String get titleBudget =>
      _localizedValues[locale.languageCode]!['title_budget']!;

  String get titleFact => _localizedValues[locale.languageCode]!['title_fact']!;

  String get titleDate => _localizedValues[locale.languageCode]!['title_date']!;

  String get titleAccount =>
      _localizedValues[locale.languageCode]!['title_account']!;

  String get titleCategory =>
      _localizedValues[locale.languageCode]!['title_category']!;

  String get titleAnalytic =>
      _localizedValues[locale.languageCode]!['title_analytic']!;

  String get titleSum => _localizedValues[locale.languageCode]!['title_sum']!;

  String get titleTotalSum =>
      _localizedValues[locale.languageCode]!['title_total_sum']!;

  String get titleMaster =>
      _localizedValues[locale.languageCode]!['title_master']!;

  String get titleTotalBalance =>
      _localizedValues[locale.languageCode]!['title_total_balance']!;

  String get titleCashflow =>
      _localizedValues[locale.languageCode]!['title_cashflow']!;

  String get titleLastOperations =>
      _localizedValues[locale.languageCode]!['title_last_operations']!;

  String get titleDataControl =>
      _localizedValues[locale.languageCode]!['title_data_control']!;

  String get titleReports =>
      _localizedValues[locale.languageCode]!['title_reports']!;

  String get titleFilters =>
      _localizedValues[locale.languageCode]!['title_filters']!;

  String get titleMonthBudgets =>
      _localizedValues[locale.languageCode]!['title_month_budgets']!;

  String get titleYearBudgets =>
      _localizedValues[locale.languageCode]!['title_year_budgets']!;

  String get emptyTitleError =>
      _localizedValues[locale.languageCode]!['empty_title_error']!;

  String get emptyBudgetError =>
      _localizedValues[locale.languageCode]!['empty_budget_error']!;

  String get emptyAccountError =>
      _localizedValues[locale.languageCode]!['empty_account_error']!;

  String get emptyCategoryError =>
      _localizedValues[locale.languageCode]!['empty_category_error']!;

  String get emptyRecAccountError =>
      _localizedValues[locale.languageCode]!['empty_rec_account_error']!;

  String get emptySumError =>
      _localizedValues[locale.languageCode]!['empty_sum_error']!;

  String get errorNoGPServices =>
      _localizedValues[locale.languageCode]!['error_no_gp_services']!;

  String get typeInput => _localizedValues[locale.languageCode]!['type_input']!;

  String get typeOutput =>
      _localizedValues[locale.languageCode]!['type_output']!;

  String get typeTransfer =>
      _localizedValues[locale.languageCode]!['type_transfer']!;

  String get budgetTypeMonth =>
      _localizedValues[locale.languageCode]!['budget_type_month']!;

  String get budgetTypeYear =>
      _localizedValues[locale.languageCode]!['budget_type_year']!;

  String get accountCardTitle =>
      _localizedValues[locale.languageCode]!['account_card_title']!;

  String get categoryCardTitle =>
      _localizedValues[locale.languageCode]!['category_card_title']!;

  String get operationCardTitle =>
      _localizedValues[locale.languageCode]!['operation_card_title']!;

  String get newAccountCardTitle =>
      _localizedValues[locale.languageCode]!['new_account_card_title']!;

  String get newCategoryCardTitle =>
      _localizedValues[locale.languageCode]!['new_category_card_title']!;

  String get newOperationCardTitle =>
      _localizedValues[locale.languageCode]!['new_operation_card_title']!;

  String get hintAccount =>
      _localizedValues[locale.languageCode]!['hint_account']!;

  String get hintCategory =>
      _localizedValues[locale.languageCode]!['hint_category']!;

  String get hintEmptyList =>
      _localizedValues[locale.languageCode]!['hint_empty_list']!;

  String get emptyListAccounts =>
      _localizedValues[locale.languageCode]!['empty_list_accounts']!;

  String get emptyListCategories =>
      _localizedValues[locale.languageCode]!['empty_list_categories']!;

  String get emptyListOperations =>
      _localizedValues[locale.languageCode]!['empty_list_operations']!;

  String get emptyListBudgets =>
      _localizedValues[locale.languageCode]!['empty_list_budgets']!;

  String get mesOperationDeleted =>
      _localizedValues[locale.languageCode]!['mes_operation_deleted']!;

  String get mesOperationCreated =>
      _localizedValues[locale.languageCode]!['mes_operation_created']!;

  String get mesOperationCanceled =>
      _localizedValues[locale.languageCode]!['mes_operation_canceled']!;

  String get mesDatabaseBackuped =>
      _localizedValues[locale.languageCode]!['mes_database_backuped']!;

  String get mesDatabaseRestored =>
      _localizedValues[locale.languageCode]!['mes_database_restored']!;

  String get mesDatabaseDeleted =>
      _localizedValues[locale.languageCode]!['mes_database_deleted']!;

  String get mesAccountArchived =>
      _localizedValues[locale.languageCode]!['mes_account_archived']!;

  String get mesCategoryArchived =>
      _localizedValues[locale.languageCode]!['mes_category_archived']!;

  String get mesAreYouSure =>
      _localizedValues[locale.languageCode]!['mes_are_you_sure']!;

  String get accounts => _localizedValues[locale.languageCode]!['accounts']!;

  String get noAccounts =>
      _localizedValues[locale.languageCode]!['no_accounts']!;

  String get categories =>
      _localizedValues[locale.languageCode]!['categories']!;

  String get noCategories =>
      _localizedValues[locale.languageCode]!['no_categories']!;

  String get operations =>
      _localizedValues[locale.languageCode]!['operations']!;

  String get operationsIn =>
      _localizedValues[locale.languageCode]!['operations_in']!;

  String get noOperations =>
      _localizedValues[locale.languageCode]!['no_operations']!;

  String get budget => _localizedValues[locale.languageCode]!['budget']!;

  String get budgets => _localizedValues[locale.languageCode]!['budgets']!;

  String get itemMenuService =>
      _localizedValues[locale.languageCode]!['item_menu_service']!;

  String get itemBarMain =>
      _localizedValues[locale.languageCode]!['item_bar_main']!;

  String get period => _localizedValues[locale.languageCode]!['period']!;

  String get lastChanges => _localizedValues[locale.languageCode]!['last_changes']!;

  String get choosePeriod =>
      _localizedValues[locale.languageCode]!['choose_period']!;

  String get chooseAccount =>
      _localizedValues[locale.languageCode]!['choose_account']!;

  String get chooseCategory =>
      _localizedValues[locale.languageCode]!['choose_category']!;

  String get inputCategory =>
      _localizedValues[locale.languageCode]!['input_category']!;

  String get outputCategory =>
      _localizedValues[locale.languageCode]!['output_category']!;

  String get earning => _localizedValues[locale.languageCode]!['earning']!;

  String get spending => _localizedValues[locale.languageCode]!['spending']!;

  String get earningIn => _localizedValues[locale.languageCode]!['earning_in']!;

  String get spendingIn => _localizedValues[locale.languageCode]!['spending_in']!;

  String get budgetType => _localizedValues[locale.languageCode]!['budget_type']!;

  String get source => _localizedValues[locale.languageCode]!['source']!;

  String get receiver => _localizedValues[locale.languageCode]!['receiver']!;

  String get yes => _localizedValues[locale.languageCode]!['yes']!;

  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;

  String get create => _localizedValues[locale.languageCode]!['create']!;

  String get save => _localizedValues[locale.languageCode]!['save']!;

  String get delete => _localizedValues[locale.languageCode]!['delete']!;

  String get duplicate => _localizedValues[locale.languageCode]!['duplicate']!;

  String get next => _localizedValues[locale.languageCode]!['next']!;

  String get more => _localizedValues[locale.languageCode]!['more']!;

  String get backup => _localizedValues[locale.languageCode]!['backup']!;

  String get restore => _localizedValues[locale.languageCode]!['restore']!;

  String get choose => _localizedValues[locale.languageCode]!['choose']!;

  String get archive => _localizedValues[locale.languageCode]!['archive']!;

  String get expand => _localizedValues[locale.languageCode]!['expand']!;

  String get collapse => _localizedValues[locale.languageCode]!['collapse']!;

  String get apply => _localizedValues[locale.languageCode]!['apply']!;

  String get reset => _localizedValues[locale.languageCode]!['reset']!;

  String get in_period => _localizedValues[locale.languageCode]!['in']!;

  String get btnAddAccount =>
      _localizedValues[locale.languageCode]!['btn_add_account']!;

  String get btnShowAll =>
      _localizedValues[locale.languageCode]!['btn_show_all']!;

  String get btnShowReports =>
      _localizedValues[locale.languageCode]!['btn_show_reports']!;

  String get btnDeleteAll =>
      _localizedValues[locale.languageCode]!['btn_delete_all']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

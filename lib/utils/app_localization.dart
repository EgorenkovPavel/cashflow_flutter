import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Title',
      'title_type': 'Type',
      'title_budget': 'Budget',
      'title_date': 'Date',
      'title_account': 'Account',
      'title_category': 'Category',
      'title_analytic': 'Analytic',
      'title_sum': 'Sum',
      'title_total_sum': 'Total sum',
      'title_master': 'Operation master',

      'empty_title_error': 'Enter title',
      'empty_budget_error': 'Enter budget',
      'empty_account_error': 'Choose account',
      'empty_category_error': 'Choose category',
      'empty_rec_account_error': 'Choose recipient account',
      'empty_sum_error': 'Enter sum',

      'type_input': 'Input',
      'type_output': 'Output',
      'type_transfer': 'Transfer',

      'account_card_title': 'Account',
      'category_card_title': 'Category',
      'operation_card_title': 'Operation',

      'new_account_card_title': 'New account',
      'new_category_card_title': 'New category',
      'new_operation_card_title': 'New operation',

      'hint_account': 'Choose account',
      'hint_category': 'Choose category',
      'hint_empty_list_accounts': 'Add accounts',
      'hint_empty_list_categories': 'Add categories',
      'hint_empty_list_operations': 'Add operations',

      'mes_operation_deleted': 'Operation deleted',
      'mes_operation_created': 'Operation created',
      'mes_account_archived': 'Account archived',
      'mes_category_archived': 'Category archived',

      'item_bar_accounts': 'Accounts',
      'item_bar_categories': 'Categories',
      'item_bar_operations': 'Operations',
      'item_menu_service': 'Service',

      'cancel': 'Cancel',
      'save': 'Save',
      'delete': 'Delete',
      'next': 'Next',
      'more': 'More',
      'backup': 'Backup',
      'restore': 'Restore',
      'choose': 'Choose',
      'archive': 'Archive',
    },
    'ru': {
      'title': 'Имя',
      'title_type': 'Тип',
      'title_budget': 'Бюджет',
      'title_date': 'Дата',
      'title_account': 'Счет',
      'title_category': 'Категория',
      'title_analytic': 'Аналитика',
      'title_sum': 'Сумма',
      'title_total_sum': 'Итого',
      'title_master': 'Мастер ввода',

      'empty_title_error': 'Введите имя',
      'empty_budget_error': 'Введите бюджет',
      'empty_account_error': 'Выберите счет',
      'empty_category_error': 'Выберите категорию',
      'empty_rec_account_error': 'Выберите счет-приемник',
      'empty_sum_error': 'Введите сумму',

      'type_input': 'Приход',
      'type_output': 'Расход',
      'type_transfer': 'Перевод',

      'account_card_title': 'Счет',
      'category_card_title': 'Категория',
      'operation_card_title': 'Операция',

      'new_account_card_title': 'Новый счет',
      'new_category_card_title': 'Новая категория',
      'new_operation_card_title': 'Новая операция',

      'hint_account': 'Выберите счет',
      'hint_category': 'Выберите категорию',
      'hint_empty_list_accounts': 'Добавьте счета',
      'hint_empty_list_categories': 'Добавьте категории',
      'hint_empty_list_operations': 'Добавьте операции',

      'mes_operation_deleted': 'Операция удалена',
      'mes_operation_created': 'Операция создана',
      'mes_account_archived': 'Счет добавлен в архив',
      'mes_category_archived': 'Категория добавлена в архив',

      'item_bar_accounts': 'Счета',
      'item_bar_categories': 'Категории',
      'item_bar_operations': 'Операции',
      'item_menu_service': 'Сервис',

      'cancel': 'Отмена',
      'save': 'Сохранить',
      'delete': 'Удалить',
      'next': 'Далее',
      'more': 'Еще',
      'backup': 'Сохранить',
      'restore': 'Восстановить',
      'choose': 'Выбрать',
      'archive': 'Архив',
    },
  };

  String get title => _localizedValues[locale.languageCode]['title'];
  String get titleType => _localizedValues[locale.languageCode]['title_type'];
  String get titleBudget => _localizedValues[locale.languageCode]['title_budget'];
  String get titleDate => _localizedValues[locale.languageCode]['title_date'];
  String get titleAccount => _localizedValues[locale.languageCode]['title_account'];
  String get titleCategory => _localizedValues[locale.languageCode]['title_category'];
  String get titleAnalytic => _localizedValues[locale.languageCode]['title_analytic'];
  String get titleSum => _localizedValues[locale.languageCode]['title_sum'];
  String get titleTotalSum => _localizedValues[locale.languageCode]['title_total_sum'];
  String get titleMaster => _localizedValues[locale.languageCode]['title_master'];

  String get emptyTitleError => _localizedValues[locale.languageCode]['empty_title_error'];
  String get emptyBudgetError => _localizedValues[locale.languageCode]['empty_budget_error'];
  String get emptyAccountError => _localizedValues[locale.languageCode]['empty_account_error'];
  String get emptyCategoryError => _localizedValues[locale.languageCode]['empty_category_error'];
  String get emptyRecAccountError => _localizedValues[locale.languageCode]['empty_rec_account_error'];
  String get emptySumError => _localizedValues[locale.languageCode]['empty_sum_error'];

  String get typeInput => _localizedValues[locale.languageCode]['type_input'];
  String get typeOutput => _localizedValues[locale.languageCode]['type_output'];
  String get typeTransfer => _localizedValues[locale.languageCode]['type_transfer'];

  String get accountCardTitle => _localizedValues[locale.languageCode]['account_card_title'];
  String get categoryCardTitle => _localizedValues[locale.languageCode]['category_card_title'];
  String get operationCardTitle => _localizedValues[locale.languageCode]['operation_card_title'];

  String get newAccountCardTitle => _localizedValues[locale.languageCode]['new_account_card_title'];
  String get newCategoryCardTitle => _localizedValues[locale.languageCode]['new_category_card_title'];
  String get newOperationCardTitle => _localizedValues[locale.languageCode]['new_operation_card_title'];

  String get hintAccount => _localizedValues[locale.languageCode]['hint_account'];
  String get hintCategory => _localizedValues[locale.languageCode]['hint_category'];
  String get hintEmptyListAccounts => _localizedValues[locale.languageCode]['hint_empty_list_accounts'];
  String get hintEmptyListCategories => _localizedValues[locale.languageCode]['hint_empty_list_categories'];
  String get hintEmptyListOperations => _localizedValues[locale.languageCode]['hint_empty_list_operations'];

  String get mesOperationDeleted => _localizedValues[locale.languageCode]['mes_operation_deleted'];
  String get mesOperationCreated => _localizedValues[locale.languageCode]['mes_operation_created'];
  String get mesAccountArchived => _localizedValues[locale.languageCode]['mes_account_archived'];
  String get mesCategoryArchived => _localizedValues[locale.languageCode]['mes_category_archived'];

  String get itemBarAccounts => _localizedValues[locale.languageCode]['item_bar_accounts'];
  String get itemBarCategories => _localizedValues[locale.languageCode]['item_bar_categories'];
  String get itemBarOperations => _localizedValues[locale.languageCode]['item_bar_operations'];
  String get itemMenuService => _localizedValues[locale.languageCode]['item_menu_service'];

  String get cancel => _localizedValues[locale.languageCode]['cancel'];
  String get save => _localizedValues[locale.languageCode]['save'];
  String get delete => _localizedValues[locale.languageCode]['delete'];
  String get next => _localizedValues[locale.languageCode]['next'];
  String get more => _localizedValues[locale.languageCode]['more'];
  String get backup => _localizedValues[locale.languageCode]['backup'];
  String get restore => _localizedValues[locale.languageCode]['restore'];
  String get choose => _localizedValues[locale.languageCode]['choose'];
  String get archive => _localizedValues[locale.languageCode]['archive'];
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

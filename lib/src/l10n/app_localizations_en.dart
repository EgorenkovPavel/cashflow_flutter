// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get title => 'Title';

  @override
  String get titleType => 'Type';

  @override
  String get titleBudget => 'Budget';

  @override
  String get titleFact => 'Fact';

  @override
  String get titleDate => 'Date';

  @override
  String get titleAccount => 'Account';

  @override
  String get titleCategory => 'Category';

  @override
  String get titleAnalytic => 'Analytic';

  @override
  String get titleSum => 'Sum';

  @override
  String get titleTotalSum => 'Total sum';

  @override
  String get titleMaster => 'Operation master';

  @override
  String get titleTotalBalance => 'Total balance';

  @override
  String get titleCashflow => 'Cashflow';

  @override
  String get titleLastOperations => 'Last operations';

  @override
  String get titleDataControl => 'Data control';

  @override
  String get titleReports => 'Reports';

  @override
  String get titleFilters => 'Filters';

  @override
  String get titleMonthBudgets => 'Month budgets';

  @override
  String get titleYearBudgets => 'Year budgets';

  @override
  String get emptyTitleError => 'Enter title';

  @override
  String get emptyBudgetError => 'Enter budget';

  @override
  String get emptyAccountError => 'Choose account';

  @override
  String get emptyCategoryError => 'Choose category';

  @override
  String get emptyRecAccountError => 'Choose recipient account';

  @override
  String get emptySumError => 'Enter sum';

  @override
  String get errorNoGpServices => 'No google play services';

  @override
  String get typeInput => 'Input';

  @override
  String get typeOutput => 'Output';

  @override
  String get typeTransfer => 'Transfer';

  @override
  String get typeExchange => 'Exchange';

  @override
  String get budgetTypeMonth => 'Month';

  @override
  String get budgetTypeYear => 'Year';

  @override
  String get accountCardTitle => 'Account';

  @override
  String get debtCardTitle => 'Debt';

  @override
  String get categoryCardTitle => 'Category';

  @override
  String get categoryGroupCardTitle => 'Group';

  @override
  String get operationCardTitle => 'Operation';

  @override
  String get newAccountCardTitle => 'New account';

  @override
  String get newDebtCardTitle => 'New debt';

  @override
  String get newCategoryCardTitle => 'New category';

  @override
  String get newCategoryGroupCardTitle => 'New group';

  @override
  String get newOperationCardTitle => 'New operation';

  @override
  String get hintAccount => 'Choose account';

  @override
  String get hintCategory => 'Choose category';

  @override
  String get hintEmptyList => 'Press button to add first one';

  @override
  String get emptyListAccounts => 'List of accounts is empty';

  @override
  String get emptyListCategories => 'List of categories is empty';

  @override
  String get emptyListOperations => 'List of operations is empty';

  @override
  String get emptyListBudgets => 'List of budgets is empty';

  @override
  String get mesOperationDeleted => 'Operation deleted';

  @override
  String get mesOperationCreated => 'Operation created';

  @override
  String get mesOperationCanceled => 'Operation canceled';

  @override
  String get mesDatabaseBackuped => 'Database backuped';

  @override
  String get mesDatabaseRestored => 'Database restored';

  @override
  String get mesDatabaseDeleted => 'Database deleted';

  @override
  String get mesAccountArchived => 'Account archived';

  @override
  String get mesCategoryArchived => 'Category archived';

  @override
  String get mesAreYouSure => 'Are you sure?';

  @override
  String get details => 'Details';

  @override
  String get accounts => 'Accounts';

  @override
  String get account => 'Account';

  @override
  String get debts => 'Debts';

  @override
  String get noItems => 'No items';

  @override
  String get noAccounts => 'No accounts';

  @override
  String get categories => 'Categories';

  @override
  String get noCategories => 'No categories';

  @override
  String get operations => 'Operations';

  @override
  String get operationsIn => 'Operations in';

  @override
  String get noOperations => 'No operations';

  @override
  String get budget => 'Budget';

  @override
  String get budgets => 'Budgets';

  @override
  String get itemMenuService => 'Service';

  @override
  String get itemBarMain => 'Main';

  @override
  String get period => 'Period';

  @override
  String get lastChanges => 'Last changes';

  @override
  String get choosePeriod => 'Choose period';

  @override
  String get chooseAccount => 'Choose account';

  @override
  String get chooseCategory => 'Choose category';

  @override
  String get inputCategory => 'Input category';

  @override
  String get outputCategory => 'Output category';

  @override
  String get earning => 'Earning';

  @override
  String get spending => 'Spending';

  @override
  String earningIn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMM(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Earning in $dateString';
  }

  @override
  String spendingIn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMM(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Spending in $dateString';
  }

  @override
  String get budgetType => 'Budget type';

  @override
  String get source => 'Source';

  @override
  String get receiver => 'Receiver';

  @override
  String get yes => 'Yes';

  @override
  String get cancel => 'Cancel';

  @override
  String get create => 'Create';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get recover => 'Recover';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get next => 'Next';

  @override
  String get more => 'More';

  @override
  String get backup => 'Backup';

  @override
  String get restore => 'Restore';

  @override
  String get choose => 'Choose';

  @override
  String get archive => 'Archive';

  @override
  String get expand => 'Expand';

  @override
  String get collapse => 'Collapse';

  @override
  String get apply => 'Apply';

  @override
  String get reset => 'Reset';

  @override
  String get inPeriod => 'in';

  @override
  String get btnAdd => 'Add';

  @override
  String get btnAddAccount => 'Add account';

  @override
  String get btnShowAll => 'Show all';

  @override
  String get btnHide => 'Hide';

  @override
  String get btnShowReports => 'Show reports';

  @override
  String get btnDeleteAll => 'Delete all';

  @override
  String get btnSync => 'Sync';

  @override
  String get item => 'Item';

  @override
  String get group => 'Group';

  @override
  String get users => 'Users';

  @override
  String get syncStateInProgress => 'In progress';

  @override
  String get syncStateSynced => 'Synced';

  @override
  String get syncStateLoadingToCloud => 'Loading to remote';

  @override
  String get syncStateLoadingFromCloud => 'Loading from remote';

  @override
  String get syncStateNoDB => 'No local';

  @override
  String get syncStateNotSynced => 'Not synced';

  @override
  String get syncStateFailure => 'Failed';
}

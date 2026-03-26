import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @titleType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get titleType;

  /// No description provided for @titleBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get titleBudget;

  /// No description provided for @titlePlan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get titlePlan;

  /// No description provided for @titleFact.
  ///
  /// In en, this message translates to:
  /// **'Fact'**
  String get titleFact;

  /// No description provided for @titleDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get titleDate;

  /// No description provided for @titleAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get titleAccount;

  /// No description provided for @titleCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get titleCategory;

  /// No description provided for @titleAnalytic.
  ///
  /// In en, this message translates to:
  /// **'Analytic'**
  String get titleAnalytic;

  /// No description provided for @titleSum.
  ///
  /// In en, this message translates to:
  /// **'Sum'**
  String get titleSum;

  /// No description provided for @titleTotalSum.
  ///
  /// In en, this message translates to:
  /// **'Total sum'**
  String get titleTotalSum;

  /// No description provided for @titleMaster.
  ///
  /// In en, this message translates to:
  /// **'Operation master'**
  String get titleMaster;

  /// No description provided for @titleTotalBalance.
  ///
  /// In en, this message translates to:
  /// **'Total balance'**
  String get titleTotalBalance;

  /// No description provided for @titleCashflow.
  ///
  /// In en, this message translates to:
  /// **'Cashflow'**
  String get titleCashflow;

  /// No description provided for @titleLastOperations.
  ///
  /// In en, this message translates to:
  /// **'Last operations'**
  String get titleLastOperations;

  /// No description provided for @titleDataControl.
  ///
  /// In en, this message translates to:
  /// **'Data control'**
  String get titleDataControl;

  /// No description provided for @titleReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get titleReports;

  /// No description provided for @titleFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get titleFilters;

  /// No description provided for @titleMonthBudgets.
  ///
  /// In en, this message translates to:
  /// **'Month budgets'**
  String get titleMonthBudgets;

  /// No description provided for @titleYearBudgets.
  ///
  /// In en, this message translates to:
  /// **'Year budgets'**
  String get titleYearBudgets;

  /// No description provided for @emptyTitleError.
  ///
  /// In en, this message translates to:
  /// **'Enter title'**
  String get emptyTitleError;

  /// No description provided for @emptyBudgetError.
  ///
  /// In en, this message translates to:
  /// **'Enter budget'**
  String get emptyBudgetError;

  /// No description provided for @emptyAccountError.
  ///
  /// In en, this message translates to:
  /// **'Choose account'**
  String get emptyAccountError;

  /// No description provided for @emptyCategoryError.
  ///
  /// In en, this message translates to:
  /// **'Choose category'**
  String get emptyCategoryError;

  /// No description provided for @emptyRecAccountError.
  ///
  /// In en, this message translates to:
  /// **'Choose recipient account'**
  String get emptyRecAccountError;

  /// No description provided for @emptySumError.
  ///
  /// In en, this message translates to:
  /// **'Enter sum'**
  String get emptySumError;

  /// No description provided for @emptyRecSumError.
  ///
  /// In en, this message translates to:
  /// **'Enter recipient sum'**
  String get emptyRecSumError;

  /// No description provided for @errorNoGpServices.
  ///
  /// In en, this message translates to:
  /// **'No google play services'**
  String get errorNoGpServices;

  /// No description provided for @typeInput.
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get typeInput;

  /// No description provided for @typeOutput.
  ///
  /// In en, this message translates to:
  /// **'Output'**
  String get typeOutput;

  /// No description provided for @typeTransfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get typeTransfer;

  /// No description provided for @typeExchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get typeExchange;

  /// No description provided for @budgetTypeMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get budgetTypeMonth;

  /// No description provided for @budgetTypeYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get budgetTypeYear;

  /// No description provided for @accountCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountCardTitle;

  /// No description provided for @debtCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Debt'**
  String get debtCardTitle;

  /// No description provided for @categoryCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryCardTitle;

  /// No description provided for @categoryGroupCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get categoryGroupCardTitle;

  /// No description provided for @operationCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Operation'**
  String get operationCardTitle;

  /// No description provided for @newAccountCardTitle.
  ///
  /// In en, this message translates to:
  /// **'New account'**
  String get newAccountCardTitle;

  /// No description provided for @newDebtCardTitle.
  ///
  /// In en, this message translates to:
  /// **'New debt'**
  String get newDebtCardTitle;

  /// No description provided for @newCategoryCardTitle.
  ///
  /// In en, this message translates to:
  /// **'New category'**
  String get newCategoryCardTitle;

  /// No description provided for @newCategoryGroupCardTitle.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get newCategoryGroupCardTitle;

  /// No description provided for @newOperationCardTitle.
  ///
  /// In en, this message translates to:
  /// **'New operation'**
  String get newOperationCardTitle;

  /// No description provided for @hintAccount.
  ///
  /// In en, this message translates to:
  /// **'Choose account'**
  String get hintAccount;

  /// No description provided for @hintCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose category'**
  String get hintCategory;

  /// No description provided for @hintEmptyList.
  ///
  /// In en, this message translates to:
  /// **'Press button to add first one'**
  String get hintEmptyList;

  /// No description provided for @emptyListAccounts.
  ///
  /// In en, this message translates to:
  /// **'List of accounts is empty'**
  String get emptyListAccounts;

  /// No description provided for @emptyListCategories.
  ///
  /// In en, this message translates to:
  /// **'List of categories is empty'**
  String get emptyListCategories;

  /// No description provided for @emptyListOperations.
  ///
  /// In en, this message translates to:
  /// **'List of operations is empty'**
  String get emptyListOperations;

  /// No description provided for @emptyListBudgets.
  ///
  /// In en, this message translates to:
  /// **'List of budgets is empty'**
  String get emptyListBudgets;

  /// No description provided for @mesOperationDeleted.
  ///
  /// In en, this message translates to:
  /// **'Operation deleted'**
  String get mesOperationDeleted;

  /// No description provided for @mesOperationCreated.
  ///
  /// In en, this message translates to:
  /// **'Operation created'**
  String get mesOperationCreated;

  /// No description provided for @mesOperationCanceled.
  ///
  /// In en, this message translates to:
  /// **'Operation canceled'**
  String get mesOperationCanceled;

  /// No description provided for @mesDatabaseBackuped.
  ///
  /// In en, this message translates to:
  /// **'Database backuped'**
  String get mesDatabaseBackuped;

  /// No description provided for @mesDatabaseRestored.
  ///
  /// In en, this message translates to:
  /// **'Database restored'**
  String get mesDatabaseRestored;

  /// No description provided for @mesDatabaseDeleted.
  ///
  /// In en, this message translates to:
  /// **'Database deleted'**
  String get mesDatabaseDeleted;

  /// No description provided for @mesAccountArchived.
  ///
  /// In en, this message translates to:
  /// **'Account archived'**
  String get mesAccountArchived;

  /// No description provided for @mesCategoryArchived.
  ///
  /// In en, this message translates to:
  /// **'Category archived'**
  String get mesCategoryArchived;

  /// No description provided for @mesAreYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get mesAreYouSure;

  /// No description provided for @limit.
  ///
  /// In en, this message translates to:
  /// **'Limit'**
  String get limit;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get owner;

  /// No description provided for @noOwner.
  ///
  /// In en, this message translates to:
  /// **'No owner'**
  String get noOwner;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @accounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accounts;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @debts.
  ///
  /// In en, this message translates to:
  /// **'Debts'**
  String get debts;

  /// No description provided for @noItems.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get noItems;

  /// No description provided for @noAccounts.
  ///
  /// In en, this message translates to:
  /// **'No accounts'**
  String get noAccounts;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @noCategories.
  ///
  /// In en, this message translates to:
  /// **'No categories'**
  String get noCategories;

  /// No description provided for @operations.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get operations;

  /// No description provided for @operationsIn.
  ///
  /// In en, this message translates to:
  /// **'Operations in'**
  String get operationsIn;

  /// No description provided for @noOperations.
  ///
  /// In en, this message translates to:
  /// **'No operations'**
  String get noOperations;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @budgets.
  ///
  /// In en, this message translates to:
  /// **'Budgets'**
  String get budgets;

  /// No description provided for @itemMenuService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get itemMenuService;

  /// No description provided for @itemBarMain.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get itemBarMain;

  /// No description provided for @period.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

  /// No description provided for @lastChanges.
  ///
  /// In en, this message translates to:
  /// **'Last changes'**
  String get lastChanges;

  /// No description provided for @choosePeriod.
  ///
  /// In en, this message translates to:
  /// **'Choose period'**
  String get choosePeriod;

  /// No description provided for @chooseAccount.
  ///
  /// In en, this message translates to:
  /// **'Choose account'**
  String get chooseAccount;

  /// No description provided for @chooseCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose category'**
  String get chooseCategory;

  /// No description provided for @inputCategory.
  ///
  /// In en, this message translates to:
  /// **'Input category'**
  String get inputCategory;

  /// No description provided for @outputCategory.
  ///
  /// In en, this message translates to:
  /// **'Output category'**
  String get outputCategory;

  /// No description provided for @earning.
  ///
  /// In en, this message translates to:
  /// **'Earning'**
  String get earning;

  /// No description provided for @spending.
  ///
  /// In en, this message translates to:
  /// **'Spending'**
  String get spending;

  /// No description provided for @topOfMonth.
  ///
  /// In en, this message translates to:
  /// **'Top of month'**
  String get topOfMonth;

  /// No description provided for @topOfYear.
  ///
  /// In en, this message translates to:
  /// **'Top of year'**
  String get topOfYear;

  /// No description provided for @average.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get average;

  /// No description provided for @median.
  ///
  /// In en, this message translates to:
  /// **'Median'**
  String get median;

  /// No description provided for @monthBudget.
  ///
  /// In en, this message translates to:
  /// **'Month budget'**
  String get monthBudget;

  /// No description provided for @yearBudget.
  ///
  /// In en, this message translates to:
  /// **'Year budget'**
  String get yearBudget;

  /// No description provided for @earningIn.
  ///
  /// In en, this message translates to:
  /// **'Earning in {date}'**
  String earningIn(DateTime date);

  /// No description provided for @spendingIn.
  ///
  /// In en, this message translates to:
  /// **'Spending in {date}'**
  String spendingIn(DateTime date);

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String itemsCount(int count);

  /// No description provided for @budgetDisplay.
  ///
  /// In en, this message translates to:
  /// **'Budget {amount} per {type, select, month{month} year{year} other{???}}'**
  String budgetDisplay(String amount, String type);

  /// No description provided for @budgetType.
  ///
  /// In en, this message translates to:
  /// **'Budget type'**
  String get budgetType;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get source;

  /// No description provided for @receiver.
  ///
  /// In en, this message translates to:
  /// **'Receiver'**
  String get receiver;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @recover.
  ///
  /// In en, this message translates to:
  /// **'Recover'**
  String get recover;

  /// No description provided for @duplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get duplicate;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get choose;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @expand.
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get expand;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @inPeriod.
  ///
  /// In en, this message translates to:
  /// **'in'**
  String get inPeriod;

  /// No description provided for @btnAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get btnAdd;

  /// No description provided for @btnAddAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get btnAddAccount;

  /// No description provided for @btnShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get btnShowAll;

  /// No description provided for @btnHide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get btnHide;

  /// No description provided for @btnShowReports.
  ///
  /// In en, this message translates to:
  /// **'Show reports'**
  String get btnShowReports;

  /// No description provided for @btnDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete all'**
  String get btnDeleteAll;

  /// No description provided for @btnSync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get btnSync;

  /// No description provided for @btnSaveAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Save and continue'**
  String get btnSaveAndContinue;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @syncStateInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get syncStateInProgress;

  /// No description provided for @syncStateSynced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get syncStateSynced;

  /// No description provided for @syncStateLoadingToCloud.
  ///
  /// In en, this message translates to:
  /// **'Loading to remote'**
  String get syncStateLoadingToCloud;

  /// No description provided for @syncStateLoadingFromCloud.
  ///
  /// In en, this message translates to:
  /// **'Loading from remote'**
  String get syncStateLoadingFromCloud;

  /// No description provided for @syncStateNoDB.
  ///
  /// In en, this message translates to:
  /// **'No local'**
  String get syncStateNoDB;

  /// No description provided for @syncStateNotSynced.
  ///
  /// In en, this message translates to:
  /// **'Not synced'**
  String get syncStateNotSynced;

  /// No description provided for @syncStateFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get syncStateFailure;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

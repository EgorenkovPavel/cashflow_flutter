import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/ui/pages/category/list_page/category_list_page.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/operation_input_page.dart';
import 'package:money_tracker/src/ui/pages/service/spring/spring_page.dart';
import 'package:money_tracker/src/ui/pages/service/users/users_page.dart';

import '../domain/models.dart';
import 'pages/account/detail_page/account_detail_page.dart';
import 'pages/account/input_page/account_input_page.dart';
import 'pages/budget_page/budget_page.dart';
import 'pages/category/detail_page/category_detail_page.dart';
import 'pages/category/input_page/category_input_page.dart';
import 'pages/home/home_page.dart';
import 'pages/operation/edit_page/operation_edit_page.dart';
import 'pages/operation/filter_page/operation_filter_page.dart';
import 'pages/operation/list_page/operation_list_page.dart';
import 'pages/reports/reports_page.dart';
import 'pages/service/cloud_database_settings/cloud_database_settings_page.dart';
import 'pages/service/data_control_page/data_control_page.dart';
import 'pages/service/drive_dialog/drive_dialog.dart';
import 'pages/service/google_drive_settings_page/google_drive_settings.dart';
import 'pages/service/settings_page/settings_page.dart';
import 'themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Money tracker',
      theme: theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // initialRoute: PageNavigator.routeRootName,
      // routes: PageNavigator.routes,
      // onGenerateRoute: PageNavigator.onGenerateRoute,
    );
  }
}

class Pages {
  static final String accountEdit = 'account';
  static final String categoryEdit = 'category';
  static final String categoryList = 'categories';
  static final String operationNew = 'operationNew';
  static final String operationEdit = 'operationEdit';
  static final String operationList = 'operations';
  static final String budgetEdit = 'budget';
  static final String settings = 'settings';
  static final String dataControl = 'dataControl';
  static final String googleDrive = 'googleDrive';
  static final String cloudDatabase = 'cloudDatabase';
  static final String spring = 'spring';
  static final String users = 'users';
  static final String reports = 'reports';
}

final _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <GoRoute>[
        GoRoute(
          name: Pages.accountEdit,
          path: 'account/:fid',
          builder: (context, state) =>
              AccountDetailPage(id: int.parse(state.pathParameters['fid']!)),
        ),
        GoRoute(
          name: Pages.categoryEdit,
          path: 'category/:fid',
          builder: (context, state) =>
              CategoryDetailPage(id: int.parse(state.pathParameters['fid']!)),
        ),
        GoRoute(
          name: Pages.operationList,
          path: 'operations',
          builder: (context, state) => const OperationListPage(),
        ),
        GoRoute(
          name: Pages.operationEdit,
          path: 'operations/:fid',
          builder: (context, state) => OperationEditPage.edit(
            int.parse(state.pathParameters['fid']!),
          ),
        ),
        GoRoute(
          name: Pages.operationNew,
          path: 'operation/new',
          builder: (context, state) => const OperationInputPage(),
        ),
        GoRoute(
          name: Pages.budgetEdit,
          path: 'budget/:fid',
          builder: (context, state) => BudgetPage(
            type: CategoryType.values.firstWhere(
              (element) => element.toString() == state.pathParameters['fid'],
            ),
          ),
        ),
        GoRoute(
          name: Pages.categoryList,
          path: 'categoryList/:fid',
          builder: (context, state) => CategoryListPage(
            type: CategoryType.values.firstWhere(
              (element) => element.toString() == state.pathParameters['fid'],
            ),
          ),
        ),
        GoRoute(
          name: Pages.settings,
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
          routes: <GoRoute>[
            GoRoute(
              name: Pages.dataControl,
              path: 'dataControl',
              builder: (context, state) => const DataControlPage(),
            ),
            GoRoute(
              name: Pages.googleDrive,
              path: 'googleDriveSettings',
              builder: (context, state) => const GoogleDriveSettingsPage(),
            ),
            GoRoute(
              name: Pages.cloudDatabase,
              path: 'cloudDatabaseSettings',
              builder: (context, state) => const CloudDatabaseSettingsPage(),
            ),
            GoRoute(
              name: Pages.spring,
              path: 'spring',
              builder: (context, state) => const SpringPage(),
            ),
            GoRoute(
              name: Pages.users,
              path: 'users',
              builder: (context, state) => const UsersPage(),
            ),
          ],
        ),
        GoRoute(
          name: Pages.reports,
          path: 'reports',
          builder: (context, state) => const ReportsPage(),
        ),
      ],
    ),
  ],
);

extension PageNavigator on BuildContext {
  void openAccountPage(int accountId) => push(namedLocation(
        Pages.accountEdit,
        pathParameters: <String, String>{'fid': accountId.toString()},
      ));

  void openCategoryPage(int categoryId) => push(namedLocation(
        Pages.categoryEdit,
        pathParameters: <String, String>{'fid': categoryId.toString()},
      ));

  void openOperationListPage() => push(namedLocation(Pages.operationList));

  void openOperationEditPage(int operationId) => push(namedLocation(
        Pages.operationEdit,
        pathParameters: <String, String>{'fid': operationId.toString()},
      ));

  void openOperationInputPage() => push(namedLocation(Pages.operationNew));

  void openSettingsPage() => push(namedLocation(Pages.settings));

  void openDataControlPage() => push(namedLocation(Pages.dataControl));

  void openSpringPage() => push(namedLocation(Pages.spring));

  void openUsersPage() => push(namedLocation(Pages.users));

  void openGoogleDriveSettingsPage() => push(namedLocation(Pages.googleDrive));

  void openCloudDatabaseSettingsPage() =>
      push(namedLocation(Pages.cloudDatabase));

  void openReportsPage() => push(namedLocation(Pages.reports));

  void openBudgetPage(CategoryType type) => push(namedLocation(
        Pages.budgetEdit,
        pathParameters: <String, String>{'fid': type.toString()},
      ));

  void openCategoryListPage(CategoryType type) => push(namedLocation(
        Pages.categoryList,
        pathParameters: <String, String>{'fid': type.toString()},
      ));

  Future<BaseAccount?> openAccountInputDialog() => const _Card<BaseAccount>()
      .open(this, const AccountInputPage.inputAccount());

  Future<BaseAccount?> openDebtInputDialog() =>
      const _Card<BaseAccount>().open(this, const AccountInputPage.inputDebt());

  Future<BaseAccount?> openAccountEditDialog(int id) =>
      const _Card<BaseAccount>().open(this, AccountInputPage.edit(id));

  Future<Category?> openCategoryInputDialog(
          {required CategoryType type, required bool isGroup}) =>
      const _Card<Category>()
          .open(this, CategoryInputPage.byType(type: type, isGroup: isGroup));

  Future<Category?> openCategoryEditDialog({required int id}) =>
      const _Card<Category>().open(this, CategoryInputPage.edit(id: id));

  Future<OperationListFilter?> openOperationFilterPage(
          OperationListFilter filter) =>
      const _Card<OperationListFilter>().open(
        this,
        OperationFilterPage(filter: filter),
      );

  Future<DriveFile?> chooseFileDialog() =>
      const _Card<DriveFile>().open(this, const DriveDialog.chooseFile());

  Future<DriveFile?> chooseFolderDialog() =>
      const _Card<DriveFile>().open(this, const DriveDialog.chooseFolder());
}

class _Card<T> {
  const _Card();

  Future<T?> open(BuildContext context, Widget child) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: child,
        );
      },
    );
  }
}

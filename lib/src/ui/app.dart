import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/operation_input_page.dart';

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

final _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <GoRoute>[
        GoRoute(
          name: 'account',
          path: 'account/:fid',
          builder: (context, state) =>
              AccountDetailPage(id: int.parse(state.pathParameters['fid']!)),
        ),
        GoRoute(
          name: 'category',
          path: 'category/:fid',
          builder: (context, state) =>
              CategoryDetailPage(id: int.parse(state.pathParameters['fid']!)),
        ),
        GoRoute(
          name: 'operation',
          path: 'operation',
          builder: (context, state) => const OperationListPage(),
        ),
        GoRoute(
          name: 'operationId',
          path: 'operation/edit/:fid',
          builder: (context, state) => OperationEditPage.edit(
            int.parse(state.pathParameters['fid']!),
          ),
        ),
        GoRoute(
          name: 'operationNew',
          path: 'operation/new',
          builder: (context, state) => const OperationInputPage(),
        ),
        GoRoute(
          name: 'budget',
          path: 'budget/:fid',
          builder: (context, state) => BudgetPage(
            type: OperationType.values.firstWhere(
              (element) => element.toString() == state.pathParameters['fid'],
            ),
          ),
        ),
        GoRoute(
          name: 'settings',
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
          routes: <GoRoute>[
            GoRoute(
              name: 'dataControl',
              path: 'dataControl',
              builder: (context, state) => const DataControlPage(),
            ),
            GoRoute(
              name: 'googleDriveSettings',
              path: 'googleDriveSettings',
              builder: (context, state) => const GoogleDriveSettingsPage(),
            ),
            GoRoute(
              name: 'cloudDatabaseSettings',
              path: 'cloudDatabaseSettings',
              builder: (context, state) => const CloudDatabaseSettingsPage(),
            ),
          ],
        ),
        GoRoute(
          name: 'reports',
          path: 'reports',
          builder: (context, state) => const ReportsPage(),
        ),
      ],
    ),
  ],
);

extension PageNavigator on BuildContext {
  void openAccountPage(int accountId) => push(namedLocation(
        'account',
        pathParameters: <String, String>{'fid': accountId.toString()},
      ));

  void openCategoryPage(int categoryId) => push(namedLocation(
        'category',
        pathParameters: <String, String>{'fid': categoryId.toString()},
      ));

  void openOperationListPage() => push(namedLocation('operation'));

  void openOperationEditPage(int operationId) => push(namedLocation(
        'operationId',
        pathParameters: <String, String>{'fid': operationId.toString()},
      ));

  void openOperationInputPage() => push(namedLocation('operationNew'));

  void openSettingsPage() => push(namedLocation('settings'));

  void openDataControlPage() => push(namedLocation('dataControl'));

  void openGoogleDriveSettingsPage() =>
      push(namedLocation('googleDriveSettings'));

  void openCloudDatabaseSettingsPage() =>
      push(namedLocation('cloudDatabaseSettings'));

  void openReportsPage() => push(namedLocation('reports'));

  void openBudgetPage(OperationType operationType) => push(namedLocation(
        'budget',
        pathParameters: <String, String>{'fid': operationType.toString()},
      ));

  Future<Account?> openAccountInputDialog() =>
      const _Card<Account>().open(this, const AccountInputPage.input());

  Future<Account?> openAccountEditDialog(int id) =>
      const _Card<Account>().open(this, AccountInputPage.edit(id));

  Future<Category?> openCategoryInputDialog({
    required OperationType type,
  }) =>
      const _Card<Category>().open(this, CategoryInputPage.byType(type: type));

  Future<Category?> openCategoryEditDialog({
    required int id,
  }) =>
      const _Card<Category>().open(this, CategoryInputPage.edit(id: id));

  Future<OperationListFilter?> openOperationFilterPage(
    OperationListFilter filter,
  ) =>
      const _Card<OperationListFilter>().open(
        this,
        OperationFilterPage(
          filter: filter,
        ),
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

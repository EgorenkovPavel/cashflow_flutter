import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../domain/models.dart';
import 'pages/account/detail_page/account_detail_page.dart';
import 'pages/account/input_page/account_input_page.dart';
import 'pages/budget_page/budget_page.dart';
import 'pages/category/detail_page/category_detail_page.dart';
import 'pages/category/input_page/category_input_page.dart';
import 'pages/home/home_page.dart';
import 'pages/operation/edit_page/operation_edit_page.dart';
import 'pages/operation/filter_page/operation_filter_page.dart';
import 'pages/operation/input_page/operation_input_page.dart';
import 'pages/operation/list_page/operation_list_page.dart';
import 'pages/reports/reports_page.dart';
import 'pages/service/cloud_database_settings/cloud_database_settings_page.dart';
import 'pages/service/data_control_page/data_control_page.dart';
import 'pages/service/drive_dialog/drive_dialog.dart';
import 'pages/service/google_drive_settings_page/google_drive_settings.dart';
import 'pages/service/settings_page/settings_page.dart';
import 'themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              AccountDetailPage(id: int.parse(state.params['fid']!)),
        ),
        GoRoute(
          name: 'category',
          path: 'category/:fid',
          builder: (context, state) =>
              CategoryDetailPage(id: int.parse(state.params['fid']!)),
        ),
        GoRoute(
          name: 'operation',
          path: 'operation',
          builder: (context, state) => const OperationListPage(),
          routes: <GoRoute>[
            GoRoute(
              name: 'operationId',
              path: 'edit/:fid',
              builder: (context, state) => OperationEditPage(
                id: int.parse(state.params['fid']!),
              ),
            ),
            GoRoute(
              name: 'operationNew',
              path: 'new',
              builder: (context, state) => const OperationInputPage(),
            ),
          ],
        ),
        GoRoute(
          name: 'budget',
          path: 'budget/:fid',
          builder: (context, state) => BudgetPage(
            type: OperationType.values.firstWhere(
              (element) => element.toString() == state.params['fid'],
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
  void openAccountPage(int accountId) => go(namedLocation(
        'account',
        params: <String, String>{'fid': accountId.toString()},
      ));

  void openCategoryPage(int categoryId) => go(namedLocation(
        'category',
        params: <String, String>{'fid': categoryId.toString()},
      ));

  void openOperationListPage() => go(namedLocation('operation'));

  void openOperationEditPage(int operationId) => go(namedLocation(
        'operationId',
        params: <String, String>{'fid': operationId.toString()},
      ));

  void openOperationInputPage() => go(namedLocation('operationNew'));

  void openSettingsPage() => go(namedLocation('settings'));

  void openDataControlPage() => go(namedLocation('dataControl'));

  void openGoogleDriveSettingsPage() =>
      go(namedLocation('googleDriveSettings'));

  void openCloudDatabaseSettingsPage() =>
      go(namedLocation('cloudDatabaseSettings'));

  void openReportsPage() => go(namedLocation('reports'));

  void openBudgetPage(OperationType operationType) => go(namedLocation(
        'budget',
        params: <String, String>{'fid': operationType.toString()},
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

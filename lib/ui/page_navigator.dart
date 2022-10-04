import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/domain/models.dart';

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

class PageNavigator extends GoRouter {
  PageNavigator()
      : super(
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
                      builder: (context, state) =>
                          const GoogleDriveSettingsPage(),
                    ),
                    GoRoute(
                      name: 'cloudDatabaseSettings',
                      path: 'cloudDatabaseSettings',
                      builder: (context, state) =>
                          const CloudDatabaseSettingsPage(),
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

  void openAccountPage(BuildContext context, int accountId) =>
      context.go(context.namedLocation(
        'account',
        params: <String, String>{'fid': accountId.toString()},
      ));

  void openCategoryPage(BuildContext context, int categoryId) =>
      context.go(context.namedLocation(
        'category',
        params: <String, String>{'fid': categoryId.toString()},
      ));

  void openOperationListPage(BuildContext context) =>
      context.go(context.namedLocation('operation'));

  void openOperationEditPage(BuildContext context, int operationId) =>
      context.go(context.namedLocation(
        'operationId',
        params: <String, String>{'fid': operationId.toString()},
      ));

  void openOperationInputPage(BuildContext context) =>
      context.go(context.namedLocation('operationNew'));

  void openSettingsPage(BuildContext context) =>
      context.go(context.namedLocation('settings'));

  void openDataControlPage(BuildContext context) =>
      context.go(context.namedLocation('dataControl'));

  void openGoogleDriveSettingsPage(BuildContext context) =>
      context.go(context.namedLocation('googleDriveSettings'));

  void openCloudDatabaseSettingsPage(BuildContext context) =>
      context.go(context.namedLocation('cloudDatabaseSettings'));

  void openReportsPage(BuildContext context) =>
      context.go(context.namedLocation('reports'));

  void openBudgetPage(BuildContext context, OperationType operationType) =>
      context.go(context.namedLocation(
        'budget',
        params: <String, String>{'fid': operationType.toString()},
      ));

  Future<Account?> openAccountInputDialog(BuildContext context) =>
      const _Card<Account>().open(context, const AccountInputPage.input());

  Future<Account?> openAccountEditDialog(BuildContext context, int id) =>
      const _Card<Account>().open(context, AccountInputPage.edit(id));

  Future<Category?> openCategoryInputDialog(
    BuildContext context, {
    required OperationType type,
  }) =>
      const _Card<Category>()
          .open(context, CategoryInputPage.byType(type: type));

  Future<Category?> openCategoryEditDialog(
    BuildContext context, {
    required int id,
  }) =>
      const _Card<Category>().open(context, CategoryInputPage.edit(id: id));

  Future<OperationListFilter?> openOperationFilterPage(
    BuildContext context,
    OperationListFilter filter,
  ) =>
      const _Card<OperationListFilter>().open(
        context,
        OperationFilterPage(
          filter: filter,
        ),
      );

  Future<DriveFile?> chooseFileDialog(BuildContext context) =>
      const _Card<DriveFile>().open(context, const DriveDialog.chooseFile());

  Future<DriveFile?> chooseFolderDialog(BuildContext context) =>
      const _Card<DriveFile>().open(context, const DriveDialog.chooseFolder());
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

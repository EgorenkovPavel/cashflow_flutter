import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/detail_page/account_detail_page.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_page.dart';
import 'package:money_tracker/ui/pages/budget_page/budget_page.dart';
import 'package:money_tracker/ui/pages/category/detail_page/category_detail_page.dart';
import 'package:money_tracker/ui/pages/category/input_page/category_input_page.dart';
import 'package:money_tracker/ui/pages/home/home_page.dart';
import 'package:money_tracker/ui/pages/operation/filter_page/operation_filter_page.dart';
import 'package:money_tracker/ui/pages/operation/input_page/operation_input_page.dart';
import 'package:money_tracker/ui/pages/operation/operation_edit_page.dart';
import 'package:money_tracker/ui/pages/operation/operation_list_page.dart';
import 'package:money_tracker/ui/pages/reports/reports_page.dart';
import 'package:money_tracker/ui/pages/service/cloud_database_settings/cloud_database_settings_page.dart';
import 'package:money_tracker/ui/pages/service/data_control_page/data_control_page.dart';
import 'package:money_tracker/ui/pages/service/drive_dialog/drive_dialog.dart';
import 'package:money_tracker/ui/pages/service/google_drive_settings_page/google_drive_settings.dart';
import 'package:money_tracker/ui/pages/service/settings_page/settings_page.dart';

class PageNavigator {

  static Future<Account?> openAccountInputPage(BuildContext context) =>
      const _Card<Account>().open(
        context,
        AccountInputPage.input(),
      );

  static Future<Account?> openAccountEditPage(BuildContext context, int id) =>
      const _Card<Account>().open(
        context,
        AccountInputPage.edit(id),
      );

  static Future<Category?> openCategoryInputPage(BuildContext context,
          {required OperationType type}) =>
      const _Card<Category>().open(
        context,
        CategoryInputPage.byType(
          type: type,
        ),
      );

  static Future<Category?> openCategoryEditPage(BuildContext context,
          {required int id}) =>
      const _Card<Category>().open(
        context,
        CategoryInputPage.edit(
          id: id,
        ),
      );

  static const _routeAccountName = '/account';

  static Future openAccountPage(BuildContext context, int accountId) =>
      Navigator.of(context).pushNamed(_routeAccountName, arguments: accountId);

  static const _routeCategoryName = '/category';

  static void openCategoryPage(BuildContext context, int categoryId) =>
      Navigator.of(context)
          .pushNamed(_routeCategoryName, arguments: categoryId);

  static const _routeOperationName = '/operation';

  static Future openOperationEditPage(BuildContext context, int operationId) =>
      Navigator.of(context)
          .pushNamed(_routeOperationName, arguments: operationId);

  static const _routeOperationFilterName = '/operationFilter';

  static Future<OperationListFilter?> openOperationFilterPage(
          BuildContext context, OperationListFilter filter) =>
      Navigator.of(context).pushNamed<OperationListFilter?>(
          _routeOperationFilterName,
          arguments: filter);

  static const _routeOperationListName = '/operationListPage';

  static Future openOperationListPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeOperationListName);

  static const _routeOperationInputName = '/masterPageNew';

  static Future openOperationInputPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeOperationInputName);

  static const _routeSettingsName = '/settings';

  static Future openSettingsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeSettingsName);

  static const _routeDataControlName = '/settings/data_control';

  static Future openDataControlPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeDataControlName);

  static const _routeGoogleDriveSettingsName = '/settings/google_drive_settings';

  static Future openGoogleDriveSettingsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeGoogleDriveSettingsName);

  static const _routeCloudDatabaseSettingsName = '/settings/cloud_database__settings';

  static Future openCloudDatabaseSettingsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeCloudDatabaseSettingsName);

  static const _routeReportsName = '/reports';

  static void openReportsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeReportsName);

  static const _routeBudgetPageName = '/budget_page';

  static Future openBudgetPage(BuildContext context, OperationType type) =>
      Navigator.of(context).pushNamed(_routeBudgetPageName, arguments: type);

  static const _routeGoogleDriveChooseFile = '/google_drive_choose_file';

  static const _routeGoogleDriveChooseFolder = '/google_drive_choose_folder';

  static Future<DriveFile?> chooseFile(BuildContext context) =>
      Navigator.of(context).pushNamed<DriveFile?>(_routeGoogleDriveChooseFile);

  static Future<DriveFile?> chooseFolder(BuildContext context) =>
      Navigator.of(context)
          .pushNamed<DriveFile?>(_routeGoogleDriveChooseFolder);

  static const routeRootName = '/';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    routeRootName: (context) => HomePage(),
    _routeOperationListName: (context) => OperationListPage(),
    _routeOperationInputName: (context) => OperationInputPage(),
    _routeSettingsName: (context) => SettingsPage(),
    _routeDataControlName: (context) => DataControlPage(),
    _routeGoogleDriveSettingsName: (context) => GoogleDriveSettingsPage(),
    _routeCloudDatabaseSettingsName: (context) => CloudDatabaseSettingsPage(),
    _routeReportsName: (context) => ReportsPage(),
  };

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
    switch (settings.name) {
      case _routeAccountName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                AccountDetailPage(id: settings.arguments as int),
          );
        }
      case _routeCategoryName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                CategoryDetailPage(id: settings.arguments as int),
          );
        }
      case _routeOperationName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                OperationEditPage(id: settings.arguments as int),
          );
        }
      case _routeOperationFilterName:
        {
          return MaterialPageRoute<OperationListFilter?>(
            builder: (context) => OperationFilterPage(
                filter: settings.arguments as OperationListFilter),
          );
        }
      case _routeBudgetPageName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                BudgetPage(type: settings.arguments as OperationType),
          );
        }
      case _routeGoogleDriveChooseFile:
        {
          return MaterialPageRoute<DriveFile?>(
            builder: (context) => DriveDialog.ChooseFile(),
          );
        }
      case _routeGoogleDriveChooseFolder:
        {
          return MaterialPageRoute<DriveFile?>(
            builder: (context) => DriveDialog.ChooseFolder(),
          );
        }
      default:
        return null;
    }
  };
}

class _Card<T> {
  const _Card();

  Future<T?> open(BuildContext context, Widget child) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
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

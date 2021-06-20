import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/edit_page/account_edit_page.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_page.dart';
import 'package:money_tracker/ui/pages/category/edit_page/category_edit_page.dart';
import 'package:money_tracker/ui/pages/category/input_page/category_input_page.dart';
import 'package:money_tracker/ui/pages/home/home_page.dart';
import 'package:money_tracker/ui/pages/operation/filter_page/operation_filter_page.dart';
import 'package:money_tracker/ui/pages/operation/input_page/operation_input_page.dart';
import 'package:money_tracker/ui/pages/operation/operation_edit_page.dart';
import 'package:money_tracker/ui/pages/operation/operation_list_page.dart';
import 'package:money_tracker/ui/pages/reports_page.dart';
import 'package:money_tracker/ui/pages/service/drive_dialog.dart';
import 'package:money_tracker/ui/pages/service/settings_page/settings_page.dart';
import 'package:money_tracker/utils/google_http_client.dart';

class PageNavigator {
  static const routeAccountName = '/account';

  static Future<Account?> openAccountInputPage(BuildContext context) =>
      const _Card<Account>().open(
        context,
        AccountInputPage(),
      );

  static Future openAccountEditPage(BuildContext context, int accountId) =>
      Navigator.of(context).pushNamed(routeAccountName, arguments: accountId);

  static const routeCategoryName = '/category';

  static void openCategoryEditPage(BuildContext context, int categoryId) =>
      Navigator.of(context).pushNamed(routeCategoryName, arguments: categoryId);

  static Future<Category?> openCategoryInputPage(BuildContext context,
          {required OperationType type}) =>
      const _Card<Category>().open(
        context,
        CategoryInputPage(
          type: type,
        ),
      );

  static const routeOperationName = '/operation';

  static Future openOperationEditPage(BuildContext context, int operationId) =>
      Navigator.of(context)
          .pushNamed(routeOperationName, arguments: operationId);

  static const routeOperationFilterName = '/operationFilter';

  static Future<OperationListFilter?> openOperationFilterPage(
          BuildContext context, OperationListFilter filter) =>
      Navigator.of(context)
          .pushNamed(routeOperationFilterName, arguments: filter);

  static const routeOperationListName = '/operationListPage';

  static Future openOperationListPage(
      BuildContext context) =>
      Navigator.of(context)
          .pushNamed(routeOperationListName);

  static const routeOperationInputName = '/masterPageNew';

  static Future openOperationInputPage(BuildContext context) =>
      Navigator.of(context).pushNamed(routeOperationInputName);

  static const routeBackupName = '/backup';

  static Future openSettingsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(routeBackupName);

  static const routeReportsName = '/reports';

  static void openReportsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(routeReportsName);

  static const routeGoogleDrive = '/google_drive';

  static Future<DriveFile?> chooseFile(
          BuildContext context, GoogleHttpClient httpClient) =>
      Navigator.of(context).pushNamed(routeGoogleDrive,
          arguments: {'client': httpClient, 'mode': DialogMode.CHOOSE_FILE});

  static Future<DriveFile?> chooseFolder(
          BuildContext context, GoogleHttpClient httpClient) =>
      Navigator.of(context).pushNamed(routeGoogleDrive,
          arguments: {'client': httpClient, 'mode': DialogMode.CHOOSE_FOLDER});

  static const routeRootName = '/';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    routeRootName: (context) => HomePage(),
        routeOperationListName: (context) => OperationListPage(),
    routeOperationInputName: (context) => OperationInputPage(),
    routeBackupName: (context) => SettingsPage(),
    routeReportsName: (context) => ReportsPage(),
  };

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
    switch (settings.name) {
      case routeAccountName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                AccountEditPage(id: settings.arguments as int),
          );
        }
      case routeCategoryName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                CategoryEditPage(id: settings.arguments as int),
          );
        }
      case routeOperationName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                OperationEditPage(id: settings.arguments as int),
          );
        }
      case routeOperationFilterName:
        {
          return MaterialPageRoute(
            builder: (context) => OperationFilterPage(
                filter: settings.arguments as OperationListFilter),
          );
        }
      case routeGoogleDrive:
        {
          var args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DriveDialog(
              httpClient: args['client'],
              mode: args['mode'],
            ),
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

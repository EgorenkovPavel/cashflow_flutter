import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/pages/account/edit_page/account_edit_page.dart';
import 'package:money_tracker/ui/pages/account/input_page/account_input_page.dart';
import 'package:money_tracker/ui/pages/budget_page/budget_page.dart';
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
  static const _routeAccountName = '/account';

  static Future<Account?> openAccountInputPage(BuildContext context) =>
      const _Card<Account>().open(
        context,
        AccountInputPage(),
      );

  static Future openAccountEditPage(BuildContext context, int accountId) =>
      Navigator.of(context).pushNamed(_routeAccountName, arguments: accountId);

  static const _routeCategoryName = '/category';

  static void openCategoryEditPage(BuildContext context, int categoryId) =>
      Navigator.of(context)
          .pushNamed(_routeCategoryName, arguments: categoryId);

  static Future<Category?> openCategoryInputPage(BuildContext context,
          {required OperationType type}) =>
      const _Card<Category>().open(
        context,
        CategoryInputPage(
          type: type,
        ),
      );

  static const _routeOperationName = '/operation';

  static Future openOperationEditPage(BuildContext context, int operationId) =>
      Navigator.of(context)
          .pushNamed(_routeOperationName, arguments: operationId);

  static const _routeOperationFilterName = '/operationFilter';

  static Future<OperationListFilter?> openOperationFilterPage(
          BuildContext context, OperationListFilter filter) =>
      Navigator.of(context)
          .pushNamed(_routeOperationFilterName, arguments: filter);

  static const _routeOperationListName = '/operationListPage';

  static Future openOperationListPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeOperationListName);

  static const _routeOperationInputName = '/masterPageNew';

  static Future openOperationInputPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeOperationInputName);

  static const _routeSettingsName = '/backup';

  static Future openSettingsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeSettingsName);

  static const _routeReportsName = '/reports';

  static void openReportsPage(BuildContext context) =>
      Navigator.of(context).pushNamed(_routeReportsName);

  static const _routeBudgetPageName = '/budget_page';

  static Future openBudgetPage(BuildContext context, OperationType type) =>
      Navigator.of(context).pushNamed(_routeBudgetPageName, arguments: type);

  static const _routeGoogleDrive = '/google_drive';

  static Future<DriveFile?> chooseFile(
          BuildContext context, GoogleHttpClient httpClient) =>
      Navigator.of(context).pushNamed<DriveFile?>(_routeGoogleDrive,
          arguments: {'client': httpClient, 'mode': DialogMode.CHOOSE_FILE});

  static Future<DriveFile?> chooseFolder(
          BuildContext context, GoogleHttpClient httpClient) =>
      Navigator.of(context).pushNamed<DriveFile?>(_routeGoogleDrive,
          arguments: {'client': httpClient, 'mode': DialogMode.CHOOSE_FOLDER});

  static const routeRootName = '/';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    routeRootName: (context) => HomePage(),
    _routeOperationListName: (context) => OperationListPage(),
    _routeOperationInputName: (context) => OperationInputPage(),
    _routeSettingsName: (context) => SettingsPage(),
    _routeReportsName: (context) => ReportsPage(),
  };

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
    switch (settings.name) {
      case _routeAccountName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                AccountEditPage(id: settings.arguments as int),
          );
        }
      case _routeCategoryName:
        {
          return MaterialPageRoute(
            builder: (context) =>
                CategoryEditPage(id: settings.arguments as int),
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
          return MaterialPageRoute(
            builder: (context) => OperationFilterPage(
                filter: settings.arguments as OperationListFilter),
          );
        }
      case _routeBudgetPageName:
        {
          return MaterialPageRoute(
            builder: (context) => BudgetPage(
                type: settings.arguments as OperationType),
          );
        }
      case _routeGoogleDrive:
        {
          var args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute<DriveFile?>(
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
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    );
  }
}

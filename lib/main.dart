import 'package:cashflow/widgets/pages/account_page.dart';
import 'package:cashflow/widgets/pages/backup_page.dart';
import 'package:cashflow/widgets/pages/budget_page.dart';
import 'package:cashflow/widgets/pages/cashflow_page.dart';
import 'package:cashflow/widgets/pages/home_page.dart';
import 'package:cashflow/widgets/pages/master_page.dart';
import 'package:cashflow/widgets/pages/category_page.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/operation_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Repository())],
      child: MaterialApp(
        title: 'Cashflow',
        theme: ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.deepOrangeAccent),
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('ru'),
        ],
        initialRoute: HomePage.routeName,
        routes: <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext context) => HomePage(),
          MasterPage.routeName: (BuildContext context) => MasterPage(),
          BackupPage.routeName: (BuildContext context) => BackupPage(),
          OperationListPage.routeName: (BuildContext context) => OperationListPage(),
          //CashflowPage.routeName: (BuildContext context) => CashflowPage(),
          //BudgetPage.routeName: (BuildContext context) => BudgetPage(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name){
            case BudgetPage.routeName: {
              final Map<String, DateTime> args = settings.arguments;
              return MaterialPageRoute(
                builder: (context) {
                  return BudgetPage(date: args['date']);
                },
              );
            }
            case AccountPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => AccountPage(
                    id: settings.arguments,
                  ));
            }
            case CategoryPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    id: settings.arguments,
                  ));
            }
            case CashflowPage.routeName: {
              return MaterialPageRoute(
                builder: (context) {
                  return CashflowPage(type: settings.arguments,);
                },
              );
            }
            default: return null;
          }
        },
      ),
    );
  }
}

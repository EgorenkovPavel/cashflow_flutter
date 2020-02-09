
import 'package:cashflow/pages/backup_page.dart';
import 'package:cashflow/pages/budget_page.dart';
import 'package:cashflow/pages/home_page.dart';
import 'package:cashflow/pages/master_page.dart';
import 'package:cashflow/pages/master_page_new.dart';
import 'package:cashflow/pages/category_page.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Model())
      ],
      child: MaterialApp(
        title: 'Cashflow',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrangeAccent
        ),
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
          MasterPage.routeName: (BuildContext context) => MasterPage(),//SimpleMasterPage(),
          MasterPageNew.routeName: (BuildContext context) => MasterPageNew(),
          BackupPage.routeName: (BuildContext context) => BackupPage(),
          //BudgetPage.routeName: (BuildContext context) => BudgetPage(),
        },
        onGenerateRoute: (settings){
          if (settings.name == BudgetPage.routeName) {
            final Map<String, DateTime> args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return BudgetPage(date: args['date']);
              },
            );
          }else if (settings.name == CategoryPage.routeName){
            return MaterialPageRoute(
              builder: (context) => CategoryPage(id: settings.arguments,)
            );
          }
          return null;
        },
      ),
    );
  }
}


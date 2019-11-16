import 'package:cashflow/pages/account_page.dart';
import 'package:cashflow/pages/backup_page.dart';
import 'package:cashflow/pages/category_page.dart';
import 'package:cashflow/pages/home_page.dart';
import 'package:cashflow/pages/master_page.dart';
import 'package:cashflow/pages/master_simple_page.dart';
import 'package:cashflow/pages/operation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => Model())
      ],
      child: MaterialApp(
        title: 'Cashflow',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        routes: <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext context) => HomePage(),
          AccountPage.routeName: (BuildContext context) => AccountPage(),
          CategoryPage.routeName: (BuildContext context) => CategoryPage(),
          //OperationPage.routeName: (BuildContext context) => OperationPage(),
          MasterPage.routeName: (BuildContext context) => SimpleMasterPage(),
          BackupPage.routeName: (BuildContext context) => BackupPage(),
        },
        onGenerateRoute: (settings){
//          return null;
          if (settings.name == OperationPage.routeName) {
            final args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return OperationPage(operation: args,);
              },
            );
          }
        },
      ),
    );
  }
}


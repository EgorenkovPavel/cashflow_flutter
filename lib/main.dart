import 'package:cashflow/data/database/database.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/account/account_edit_page.dart';
import 'package:cashflow/widgets/pages/account/account_input_page.dart';
import 'package:cashflow/widgets/pages/budget/budget_card.dart';
import 'package:cashflow/widgets/pages/category/category_edit_page.dart';
import 'package:cashflow/widgets/pages/category/category_input_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_edit_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_filter_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_input_bloc.dart';
import 'package:cashflow/widgets/pages/operation/operation_input_page.dart';
import 'package:cashflow/widgets/pages/reports_page.dart';
import 'package:cashflow/widgets/pages/service/backup_page.dart';
import 'package:cashflow/widgets/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/repository.dart';

void main() {
  final _repository = Repository(Database());

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AccountCardBloc>(
          create: (BuildContext context) => AccountCardBloc(_repository),
        ),
        BlocProvider<CategoryCardBloc>(
          create: (BuildContext context) => CategoryCardBloc(_repository),
        ),
        BlocProvider<BudgetCardBloc>(
          create: (BuildContext context) => BudgetCardBloc(_repository),
        ),
        BlocProvider<AccountEditPageBloc>(
          create: (BuildContext context) => AccountEditPageBloc(_repository),
        ),
        BlocProvider<BackupPageBloc>(
          create: (BuildContext context) => BackupPageBloc(_repository),
        ),
        BlocProvider<MasterBloc>(
          create: (BuildContext context) => MasterBloc(_repository),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _repository),
          ChangeNotifierProvider(create: (context) => ThemeModel())
        ],
        child: MyApp(),
      )));
}

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;

  ThemeMode get mode => _mode;

  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setMode(ThemeMode mode){
    if(_mode != mode){
      _mode = mode;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cashflow',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[900],
        primarySwatch: Colors.grey,
        accentColor: Colors.deepOrangeAccent,
        primaryTextTheme: TextTheme(

        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.black,

          ),
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black
          ),
          //brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        primarySwatch: Colors.grey,
        accentColor: Colors.deepOrangeAccent,
       ),
      themeMode: context.watch<ThemeModel>()._mode,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ru'),
      ],
      initialRoute: StartPage.routeName,
      routes: <String, WidgetBuilder>{
        StartPage.routeName: (BuildContext context) => StartPage(),
        //HomePage(),
        OperationInputPage.routeName: (BuildContext context) =>
            OperationInputPage(),
        BackupPage.routeName: (BuildContext context) => BackupPage(),
        ReportsPage.routeName: (BuildContext context) => ReportsPage(),
        OperationFilterPage.routeName: (BuildContext context) =>
            OperationFilterPage(),
        //CashflowPage.routeName: (BuildContext context) => CashflowPage(),
        //BudgetPage.routeName: (BuildContext context) => BudgetPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AccountEditPage.routeName:
            {
              return MaterialPageRoute(
                  builder: (context) =>
                      AccountEditPage(id: settings.arguments as int));
            }
          case CategoryEditPage.routeName:
            {
              return MaterialPageRoute(
                  builder: (context) =>
                      CategoryEditPage(id: settings.arguments as int));
            }
          case OperationEditPage.routeName:
            {
              return MaterialPageRoute(
                  builder: (context) =>
                      OperationEditPage(id: settings.arguments as int));
            }
          default:
            return null;
        }
      },
    );
  }
}

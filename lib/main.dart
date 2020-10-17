import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/cards/cashflow_bloc.dart';
import 'package:cashflow/widgets/cards/last_operations_bloc.dart';
import 'package:cashflow/widgets/cards/total_balance_bloc.dart';
import 'package:cashflow/widgets/pages/account/account_edit_page.dart';
import 'package:cashflow/widgets/pages/account/account_input_page.dart';
import 'package:cashflow/widgets/pages/budget/budget_card.dart';
import 'package:cashflow/widgets/pages/category/category_edit_page.dart';
import 'package:cashflow/widgets/pages/category/category_input_page.dart';
import 'package:cashflow/widgets/pages/category/category_list_page.dart';
import 'package:cashflow/widgets/pages/home_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_edit_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_filter_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_input_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_list_page.dart';
import 'package:cashflow/widgets/pages/reports_page.dart';
import 'package:cashflow/widgets/pages/service/backup_page.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/repository.dart';

void main(){
  final Repository _repository = Repository();

  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<TotalBalanceBloc>(
            create: (BuildContext context) => TotalBalanceBloc(_repository),
          ),
          BlocProvider<LastOperationsBloc>(
            create: (BuildContext context) => LastOperationsBloc(_repository),
          ),
          BlocProvider<CashflowCardBloc>(
            create: (BuildContext context) => CashflowCardBloc(_repository),
          ),
          BlocProvider<AccountCardBloc>(
            create: (BuildContext context) => AccountCardBloc(_repository),
          ),
          BlocProvider<CategoryCardBloc>(
            create: (BuildContext context) => CategoryCardBloc(_repository),
          ),
          BlocProvider<BudgetCardBloc>(
            create: (BuildContext context) => BudgetCardBloc(_repository),
          ),
          BlocProvider<AccountPageBloc>(
            create: (BuildContext context) => AccountPageBloc(_repository),
          ),
          BlocProvider<BackupPageBloc>(
            create: (BuildContext context) => BackupPageBloc(_repository),
          ),
          BlocProvider<MasterBloc>(
            create: (BuildContext context) => MasterBloc(_repository),
          ),
        ],
        child: MultiProvider(
          providers: [ChangeNotifierProvider(create: (context) => _repository)],
          child: MyApp(),
        )
      )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          CategoryListPage.routeName: (BuildContext context) => CategoryListPage(),
          OperationInputPage.routeName: (BuildContext context) => OperationInputPage(),
          BackupPage.routeName: (BuildContext context) => BackupPage(),
          OperationListPage.routeName: (BuildContext context) => OperationListPage(),
          ReportsPage.routeName: (BuildContext context) => ReportsPage(),
          OperationFilterPage.routeName: (BuildContext context) => OperationFilterPage(),
          //CashflowPage.routeName: (BuildContext context) => CashflowPage(),
          //BudgetPage.routeName: (BuildContext context) => BudgetPage(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name){
            case AccountEditPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => AccountEditPage(id: settings.arguments));
            }
            case CategoryEditPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => CategoryEditPage(id: settings.arguments));
            }
            case OperationEditPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => OperationEditPage(id: settings.arguments));
            }
            default: return null;
          }
        },
    );
  }
}

import 'package:cashflow/widgets/cards/cashflow_card.dart';
import 'package:cashflow/widgets/cards/last_operations_card.dart';
import 'package:cashflow/widgets/cards/total_balance_card.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/item_cards/budget_card.dart';
import 'package:cashflow/widgets/item_cards/category_card.dart';
import 'package:cashflow/widgets/lists/category_list.dart';
import 'package:cashflow/widgets/pages/account_page.dart';
import 'package:cashflow/widgets/pages/backup_page.dart';
import 'package:cashflow/widgets/pages/cashflow_page.dart';
import 'package:cashflow/widgets/pages/home_page.dart';
import 'package:cashflow/widgets/pages/master_page.dart';
import 'package:cashflow/widgets/pages/category_page.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/operation_list_page.dart';
import 'package:cashflow/widgets/pages/operation_page.dart';
import 'package:cashflow/widgets/pages/reporst_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

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
          CategoryList.routeName: (BuildContext context) => CategoryList(),
          MasterPage.routeName: (BuildContext context) => MasterPage(),
          BackupPage.routeName: (BuildContext context) => BackupPage(),
          OperationListPage.routeName: (BuildContext context) => OperationListPage(),
          ReportsPage.routeName: (BuildContext context) => ReportsPage(),
          //CashflowPage.routeName: (BuildContext context) => CashflowPage(),
          //BudgetPage.routeName: (BuildContext context) => BudgetPage(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name){
            case AccountPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => AccountPage(id: settings.arguments));
            }
            case CategoryPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => CategoryPage(id: settings.arguments));
            }
            case OperationPage.routeName: {
              return MaterialPageRoute(
                  builder: (context) => OperationPage(id: settings.arguments));
            }
            case CashflowPage.routeName: {
              return MaterialPageRoute(
                builder: (context) => CashflowPage(type: settings.arguments));
            }
            default: return null;
          }
        },
    );
  }
}

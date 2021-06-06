import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_tracker/domain/theme_model.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/utils/app_localization.dart';

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
        primaryTextTheme: TextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          //brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        primarySwatch: Colors.grey,
        accentColor: Colors.deepOrangeAccent,
      ),
      themeMode: context.watch<ThemeModel>().mode,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ru'),
      ],
      initialRoute: PageNavigator.routeRootName,
      routes: PageNavigator.routes,
      onGenerateRoute: PageNavigator.onGenerateRoute,
    );
  }
}

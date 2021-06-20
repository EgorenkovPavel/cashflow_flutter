import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/themes.dart';
import 'package:money_tracker/utils/app_localization.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money tracker',
      theme: theme(),
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

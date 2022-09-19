import 'package:flutter/material.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money tracker',
      theme: theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: PageNavigator.routeRootName,
      routes: PageNavigator.routes,
      onGenerateRoute: PageNavigator.onGenerateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/src/ui/themes.dart';

import '../injection_container.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: sl(),
      debugShowCheckedModeBanner: false,
      title: 'Money tracker',
      theme: theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // initialRoute: PageNavigator.routeRootName,
      // routes: PageNavigator.routes,
      // onGenerateRoute: PageNavigator.onGenerateRoute,
    );
  }


}

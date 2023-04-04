import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/src/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/src/ui/app.dart';

import 'src/injection_container.dart';
import 'src/utils/app_bloc_observer.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      await init();

      Bloc.observer = AppBlocObserver();

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              lazy: false,
              create: (_) => sl(),
            ),
            BlocProvider<SyncBloc>(
              lazy: false,
              create: (_) => sl(),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stack) {
      if (!kDebugMode) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    },
  );
}

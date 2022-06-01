import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/ui/app.dart';

import 'injection_container.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    await init();

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
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

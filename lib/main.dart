import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore_for_file: unused_import
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/data/repositories/auth_repository_impl.dart';
import 'package:money_tracker/data/repositories/data_repository_impl.dart';
import 'package:money_tracker/data/repositories/sync_repository_impl.dart';
import 'package:money_tracker/data/sources/auth/auth_source.dart';
import 'package:money_tracker/data/sources/auth/auth_source_impl.dart';
import 'package:money_tracker/data/sources/backup_source.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/data/sources/local/database_source.dart';
import 'package:money_tracker/data/sources/network_info.dart';
import 'package:money_tracker/data/sources/remote/firecloud_source.dart';
import 'package:money_tracker/data/sources/settings_source.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/interfaces/sync_repository.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection_container.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {

    await init();

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => AuthBloc(sl()),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => SyncBloc(
              authBloc: context.read<AuthBloc>(),
              prefsRepository: sl(),
              syncRepo: sl(),
            ),
          ),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AuthRepository>(create: (_) => sl()),
            RepositoryProvider<DataRepository>(create: (_) => sl()),
            RepositoryProvider<SharedPrefs>(create: (_) => sl()),
          ],
          child: const MyApp(),
        ),
      ),
    );
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

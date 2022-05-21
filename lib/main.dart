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

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    final db = Database();
    final databaseSource = DatabaseSource(db);

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    final firestore = FirebaseFirestore.instance;
    firestore.settings = const Settings(persistenceEnabled: false);

    final googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );
    final firebaseAuth = FirebaseAuth.instance;

    final NetworkInfo networkInfo = NetworkInfoImpl(Connectivity());

    final AuthSource authSource = GoogleAuth(googleSignIn, firebaseAuth);

    final AuthRepository authRepository =
        AuthRepositoryImpl(authSource, networkInfo);

    final cloudSource = FirecloudSource(firestore);

    final prefs = await SharedPreferences.getInstance();

    final prefsRepo = SharedPrefs(prefs);

    final dataSource = DataRepositoryImpl(databaseSource);

    final SyncRepository syncRepo =
        SyncRepositoryImpl(cloudSource, databaseSource, networkInfo);

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => AuthBloc(authRepository),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => SyncBloc(
              authBloc: context.read<AuthBloc>(),
              prefsRepository: prefsRepo,
              syncRepo: syncRepo,
            ),
          ),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AuthRepository>(create: (_) => authRepository),
            RepositoryProvider<DataRepository>(create: (_) => dataSource),
            RepositoryProvider<SharedPrefs>(create: (_) => prefsRepo),
          ],
          child: const MyApp(),
        ),
      ),
    );
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

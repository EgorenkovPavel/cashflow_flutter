import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_tracker/data/sources/remote/remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/data_repository_impl.dart';
import 'data/repositories/sync_repository_impl.dart';
import 'data/sources/auth/auth_source.dart';
import 'data/sources/auth/auth_source_impl.dart';
import 'data/sources/local/data/database.dart';
import 'data/sources/local/database_source.dart';
import 'data/sources/local/local_data_source.dart';
import 'data/sources/local/local_sync_source.dart';
import 'data/sources/network_info.dart';
import 'data/sources/remote/firecloud_source.dart';
import 'data/sources/settings_source.dart';
import 'domain/interfaces/auth_repository.dart';
import 'domain/interfaces/data_repository.dart';
import 'domain/interfaces/sync_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  sl.registerLazySingleton(() => Database());
  sl.registerLazySingleton(() => DatabaseSource(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => sl<DatabaseSource>());
  sl.registerLazySingleton<LocalSyncSource>(() => sl<DatabaseSource>());

  sl.registerLazySingleton(() {
    final firestore = FirebaseFirestore.instance;
    firestore.settings = const Settings(persistenceEnabled: false);
    return firestore;
  });

  sl.registerLazySingleton(() => GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/drive',
        ],
      ));

  sl.registerLazySingleton(() => FirebaseAuth.instance);

  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton<AuthSource>(() => GoogleAuth(
        firebaseAuth: sl(),
        googleSignIn: sl(),
      ));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<RemoteDataSource>(() => FirecloudSource(sl()));

  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => prefs);

  sl.registerLazySingleton<SettingsSource>(() => SharedPrefs(sl()));

  sl.registerLazySingleton<DataRepository>(() => DataRepositoryImpl(sl()));

  sl.registerLazySingleton<SyncRepository>(() => SyncRepositoryImpl(
        localSource: sl(),
        remoteSource: sl(),
        networkInfo: sl(),
      ));
}

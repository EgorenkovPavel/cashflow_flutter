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

import 'common_blocs/auth/auth_bloc.dart';
import 'common_blocs/sync/sync_bloc.dart';
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
import 'domain/interfaces/data/data_repository.dart';
import 'domain/interfaces/sync_repository.dart';
import 'ui/pages/account/detail_page/account_detail_bloc.dart';
import 'ui/pages/account/input_page/account_input_bloc.dart';
import 'ui/pages/budget_page/budget_bloc.dart';
import 'ui/pages/category/detail_page/category_detail_bloc.dart';
import 'ui/pages/category/input_page/category_input_bloc.dart';
import 'ui/pages/home/last_operations/last_operations_bloc.dart';
import 'ui/pages/home/month_operations/month_operations_bloc.dart';
import 'ui/pages/home/top_header/top_header_bloc.dart';
import 'ui/pages/operation/edit_page/operation_edit_bloc.dart';
import 'ui/pages/operation/filter_page/operation_filter_bloc.dart';
import 'ui/pages/operation/input_page/operation_input_bloc.dart';
import 'ui/pages/operation/list_page/operation_list_bloc.dart';
import 'ui/pages/reports/reports_bloc.dart';
import 'ui/pages/service/data_control_page/data_control_page_bloc.dart';
import 'ui/pages/service/drive_dialog/drive_dialog_bloc.dart';
import 'ui/pages/service/google_drive_settings_page/google_drive_settings_bloc.dart';

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

  // BLOCs

  sl.registerLazySingleton(() => AuthBloc(sl()));

  sl.registerLazySingleton(() => SyncBloc(
        authBloc: sl(),
        prefsRepository: sl(),
        syncRepo: sl(),
      ));

  sl.registerFactoryParam<DriveDialogBloc, DialogMode, void>(
      (mode, _) => DriveDialogBloc(
            repository: sl(),
            mode: mode,
          ));

  sl.registerFactory(() => DriveBloc(
        dataRepository: sl(),
        authBloc: sl(),
        authRepository: sl(),
      ));

  sl.registerFactory(() => AccountDetailBloc(sl()));
  sl.registerFactory(() => AccountInputBloc(sl()));

  sl.registerFactory(() => BudgetBloc(sl()));
  sl.registerFactory(() => CategoryDetailBloc(sl()));
  sl.registerFactory(() => CategoryInputBloc(sl()));

  sl.registerFactory(() => LastOperationsBloc(sl()));
  sl.registerFactory(() => MonthOperationsBloc(sl()));
  sl.registerFactory(() => TopHeaderBloc(sl()));

  sl.registerFactory(() => OperationEditBloc(sl()));
  sl.registerFactory(() => OperationFilterBloc(sl()));
  sl.registerFactory(() => MasterBloc(sl()));
  sl.registerFactory(() => OperationListBloc(sl()));
  sl.registerFactory(() => ReportsBloc(sl()));
  sl.registerFactory(() => DataControlBloc(sl()));
}

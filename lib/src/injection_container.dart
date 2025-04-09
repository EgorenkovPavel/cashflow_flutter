import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_tracker/src/domain/interfaces/currency_interactor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common_blocs/auth/auth_bloc.dart';
import 'common_blocs/sync/sync_bloc.dart';
import 'data/interfaces/auth_source.dart';
import 'data/interfaces/local_sync_source.dart';
import 'data/interfaces/network_info.dart';
import 'data/interfaces/remote_data_source.dart';
import 'data/interfaces/settings_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/backup_repository_impl.dart';
import 'data/repositories/data_repository_impl.dart';
import 'data/repositories/sync_repository_impl.dart';
import 'data/sources/auth_source_impl.dart';
import 'data/sources/currency_rate_source.dart';
import 'data/sources/local/data/account_dao.dart';
import 'data/sources/local/data/category_dao.dart';
import 'data/sources/local/data/database.dart';
import 'data/sources/local/data/operation_dao.dart';
import 'data/sources/local/data/user_dao.dart';
import 'data/sources/local/local_sync_source_impl.dart';
import 'data/sources/local/repos/account_data_repository_impl.dart';
import 'data/sources/local/repos/category_data_repository_impl.dart';
import 'data/sources/local/repos/operation_data_repository_impl.dart';
import 'data/sources/network_info_impl.dart';
import 'data/sources/remote/remote_source_impl.dart';
import 'data/sources/settings_source_impl.dart';
import 'domain/interactors/account_interactor.dart';
import 'domain/interactors/category_interactor.dart';
import 'domain/interactors/operation_interactor.dart';
import 'domain/interactors/user_interactor.dart';
import 'domain/interfaces/auth_repository.dart';
import 'domain/interfaces/backup_repository.dart';
import 'domain/interfaces/data_repository.dart';
import 'domain/interfaces/sync_repository.dart';
import 'domain/models.dart';
import 'ui/blocs/account_balance_bloc.dart';
import 'ui/blocs/category_cashflow_bloc.dart';
import 'ui/blocs/currency_rate_bloc.dart';
import 'ui/pages/account/detail_page/account_detail_bloc.dart';
import 'ui/pages/account/input_page/account_input_bloc.dart';
import 'ui/pages/budget_page/budget_bloc.dart';
import 'ui/pages/category/detail_page/category_detail_bloc.dart';
import 'ui/pages/category/input_page/category_input_bloc.dart';
import 'ui/pages/home/home_page_cards/last_operations/last_operations_bloc.dart';
import 'ui/pages/operation/edit_page/operation_edit_bloc.dart';
import 'ui/pages/operation/filter_page/operation_filter_bloc.dart';
import 'ui/pages/operation/input_page/operation_input_bloc.dart';
import 'ui/pages/operation/list_page/operation_list_bloc.dart';
import 'ui/pages/reports/reports_bloc.dart';
import 'ui/pages/service/data_control_page/data_control_bloc.dart';
import 'ui/pages/service/drive_dialog/drive_dialog_bloc.dart';
import 'ui/pages/service/google_drive_settings_page/google_drive_settings_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  sl.registerLazySingleton<SettingsSource>(
      () => SettingsSourceImpl(sl<SharedPreferences>()));

  sl.registerLazySingleton<Database>(() => Database());
  sl.registerLazySingleton<AccountDao>(() => AccountDao(sl<Database>()));
  sl.registerLazySingleton<CategoryDao>(() => CategoryDao(sl<Database>()));
  sl.registerLazySingleton<OperationDao>(() => OperationDao(sl<Database>()));
  sl.registerLazySingleton<UserDao>(() => UserDao(sl<Database>()));

  sl.registerLazySingleton<DataRepository>(() => DataRepositoryImpl(
        accountDao: sl<AccountDao>(),
        categoryDao: sl<CategoryDao>(),
        operationDao: sl<OperationDao>(),
        userDao: sl<UserDao>(),
        currencyRateSource: CurrencyRateSource(settingsSource: sl()),
      ));

  sl.registerLazySingleton<LocalSyncTable<BaseAccount>>(
      () => AccountDataRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<LocalSyncTable<Category>>(
      () => CategoryDataRepositoryImpl(sl()));
  sl.registerLazySingleton<LocalSyncTable<Operation>>(
      () => OperationDataRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton<LocalSyncSource>(() => LocalSyncSourceImpl(
        accountRepo: sl<LocalSyncTable<BaseAccount>>(),
        categoryRepo: sl<LocalSyncTable<Category>>(),
        operationRepo: sl<LocalSyncTable<Operation>>(),
        dataRepository: sl<DataRepository>(),
      ));

  sl.registerLazySingleton<FirebaseFirestore>(() {
    final firestore = FirebaseFirestore.instance;
    firestore.settings = const Settings(persistenceEnabled: false);

    return firestore;
  });

  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/drive',
        ],
      ));

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<Connectivity>()));

  sl.registerLazySingleton<AuthSource>(() => GoogleAuth(
        firebaseAuth: sl<FirebaseAuth>(),
        googleSignIn: sl<GoogleSignIn>(),
      ));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authSource: sl<AuthSource>(),
        networkInfo: sl<NetworkInfo>(),
      ));

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteSourceImpl(sl<FirebaseFirestore>()));

  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<SyncRepository>(() => SyncRepositoryImpl(
        localSource: sl<LocalSyncSource>(),
        remoteSource: sl<RemoteDataSource>(),
        networkInfo: sl<NetworkInfo>(),
        dataRepository: sl<DataRepository>(),
      ));

  sl.registerLazySingleton<BackupRepository>(
    () => BackupRepositoryImpl(sl<Database>()),
  );

  //USE CASES

  sl.registerFactory(() => UserInteractor(sl<DataRepository>()));
  sl.registerFactory(() => AccountInteractor(sl<DataRepository>()));
  sl.registerFactory(() => CategoryInteractor(sl<DataRepository>()));
  sl.registerFactory(() => OperationInteractor(sl<DataRepository>()));
  sl.registerFactory(() => CurrencyInteractor(sl<DataRepository>()));

  // BLOCs

  sl.registerLazySingleton(() => AuthBloc(sl<AuthRepository>()));

  sl.registerLazySingleton(() => SyncBloc(
        authBloc: sl<AuthBloc>(),
        prefsRepository: sl<SettingsSource>(),
        syncRepo: sl<SyncRepository>(),
      ));

  sl.registerLazySingleton(() => CurrencyRateBloc(sl<CurrencyInteractor>()));

  sl.registerLazySingleton(() => AccountBalanceBloc(sl<AccountInteractor>()));

  sl.registerLazySingleton(() => CategoryCashflowBloc(
        sl<CurrencyRateBloc>(),
        sl<CategoryInteractor>(),
      ));

  sl.registerFactoryParam<DriveDialogBloc, DialogMode, void>(
    (mode, _) => DriveDialogBloc(
      repository: sl<AuthRepository>(),
      mode: mode,
    ),
  );

  sl.registerFactory(() => DriveBloc(
        backupRepository: sl<BackupRepository>(),
        authBloc: sl<AuthBloc>(),
        authRepository: sl<AuthRepository>(),
      ));

  sl.registerFactory(() => AccountDetailBloc(
        sl<AccountInteractor>(),
        sl<OperationInteractor>(),
      ));
  sl.registerFactory(() => AccountInputBloc(
        sl<AccountInteractor>(),
        sl<UserInteractor>(),
      ));

  sl.registerFactory(() => BudgetBloc(sl<DataRepository>()));

  sl.registerFactory(() => CategoryDetailBloc(
        sl<CategoryInteractor>(),
        sl<OperationInteractor>(),
      ));

  sl.registerFactory(() => CategoryInputBloc(sl<CategoryInteractor>()));
  sl.registerFactory(() => LastOperationsBloc(sl<OperationInteractor>()));
  sl.registerFactory(() => OperationEditBloc(sl<OperationInteractor>()));
  sl.registerFactory(() => MasterBloc(sl<OperationInteractor>()));
  sl.registerFactory(() => OperationFilterBloc());
  sl.registerFactory(() => OperationListBloc(sl<OperationInteractor>()));
  sl.registerFactory(() => ReportsBloc(sl<DataRepository>()));
  sl.registerFactory(() => DataControlBloc(sl<BackupRepository>()));
}

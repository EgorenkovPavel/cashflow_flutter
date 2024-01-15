import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_tracker/src/data/interfaces/remote_data_source.dart';
import 'package:money_tracker/src/data/repositories/backup_repository_impl.dart';
import 'package:money_tracker/src/data/sources/local/local_sync_source_impl.dart';
import 'package:money_tracker/src/domain/interfaces/backup_repository.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/operation_input_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../src/common_blocs/auth/auth_bloc.dart';
import '../src/common_blocs/sync/sync_bloc.dart';
import '../src/data/interfaces/auth_source.dart';
import '../src/data/interfaces/local_sync_source.dart';
import '../src/data/interfaces/network_info.dart';
import '../src/data/interfaces/settings_source.dart';
import '../src/data/repositories/auth_repository_impl.dart';
import '../src/data/repositories/data_repository_impl.dart';
import '../src/data/repositories/sync_repository_impl.dart';
import '../src/data/sources/auth_source_impl.dart';
import '../src/data/sources/local/data/account_dao.dart';
import '../src/data/sources/local/data/category_dao.dart';
import '../src/data/sources/local/data/database.dart';
import '../src/data/sources/local/data/operation_dao.dart';
import '../src/data/sources/local/repos/account_data_repository_impl.dart';
import '../src/data/sources/local/repos/category_data_repository_impl.dart';
import '../src/data/sources/local/repos/operation_data_repository_impl.dart';
import '../src/data/sources/network_info_impl.dart';
import '../src/data/sources/remote/remote_source_impl.dart';
import '../src/data/sources/settings_source_impl.dart';
import '../src/domain/interfaces/auth_repository.dart';
import '../src/domain/interfaces/data/account_data_repository.dart';
import '../src/domain/interfaces/data/category_data_repository.dart';
import '../src/domain/interfaces/data/data_repository.dart';
import '../src/domain/interfaces/data/operation_data_repository.dart';
import '../src/domain/interfaces/sync_repository.dart';
import '../src/ui/pages/account/detail_page/account_detail_bloc.dart';
import '../src/ui/pages/account/input_page/account_input_bloc.dart';
import '../src/ui/pages/budget_page/budget_bloc.dart';
import '../src/ui/pages/category/detail_page/category_detail_bloc.dart';
import '../src/ui/pages/category/input_page/category_input_bloc.dart';
import '../src/ui/pages/home/last_operations/last_operations_bloc.dart';
import '../src/ui/pages/operation/edit_page/operation_edit_bloc.dart';
import '../src/ui/pages/operation/filter_page/operation_filter_bloc.dart';
import '../src/ui/pages/operation/list_page/operation_list_bloc.dart';
import '../src/ui/pages/reports/reports_bloc.dart';
import '../src/ui/pages/service/data_control_page/data_control_bloc.dart';
import '../src/ui/pages/service/drive_dialog/drive_dialog_bloc.dart';
import '../src/ui/pages/service/google_drive_settings_page/google_drive_settings_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  sl.registerLazySingleton<AccountDataRepositoryImpl>(
    () => AccountDataRepositoryImpl(AccountDao(sl<Database>())),
  );
  sl.registerLazySingleton<CategoryDataRepositoryImpl>(
    () => CategoryDataRepositoryImpl(CategoryDao(sl<Database>())),
  );
  sl.registerLazySingleton<OperationDataRepositoryImpl>(
    () => OperationDataRepositoryImpl(OperationDao(sl<Database>())),
  );

  sl.registerLazySingleton<LocalSyncTable<Account>>(
    () => sl<AccountDataRepositoryImpl>(),
  );
  sl.registerLazySingleton<LocalSyncTable<Category>>(
    () => sl<CategoryDataRepositoryImpl>(),
  );
  sl.registerLazySingleton<LocalSyncTable<Operation>>(
    () => sl<OperationDataRepositoryImpl>(),
  );

  sl.registerLazySingleton<Database>(() => Database());
  sl.registerLazySingleton<LocalSyncSource>(() => LocalSyncSourceImpl(
        accountRepo: sl<LocalSyncTable<Account>>(),
        categoryRepo: sl<LocalSyncTable<Category>>(),
        operationRepo: sl<LocalSyncTable<Operation>>(),
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
    () => NetworkInfoImpl(sl<Connectivity>()),
  );

  sl.registerLazySingleton<AuthSource>(() => GoogleAuth(
        firebaseAuth: sl<FirebaseAuth>(),
        googleSignIn: sl<GoogleSignIn>(),
      ));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authSource: sl<AuthSource>(),
        networkInfo: sl<NetworkInfo>(),
      ));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteSourceImpl(sl()));

  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<SettingsSource>(
    () => SettingsSourceImpl(sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<AccountDataRepository>(
    () => sl<AccountDataRepositoryImpl>(),
  );
  sl.registerLazySingleton<CategoryDataRepository>(
    () => sl<CategoryDataRepositoryImpl>(),
  );
  sl.registerLazySingleton<OperationDataRepository>(
    () => sl<OperationDataRepositoryImpl>(),
  );

  sl.registerLazySingleton<DataRepository>(() => DataRepositoryImpl(
        accountRepo: sl<AccountDataRepository>(),
        categoryRepo: sl<CategoryDataRepository>(),
        operationRepo: sl<OperationDataRepository>(),
      ));

  sl.registerLazySingleton<SyncRepository>(() => SyncRepositoryImpl(
        localSource: sl<LocalSyncSource>(),
        remoteSource: sl<RemoteDataSource>(),
        networkInfo: sl<NetworkInfo>(),
      ));

  sl.registerLazySingleton<BackupRepository>(
    () => BackupRepositoryImpl(sl<Database>()),
  );

  // BLOCs

  sl.registerLazySingleton(() => AuthBloc(sl<AuthRepository>()));

  sl.registerLazySingleton(() => SyncBloc(
        authBloc: sl<AuthBloc>(),
        prefsRepository: sl<SettingsSource>(),
        syncRepo: sl<SyncRepository>(),
      ));

  sl.registerLazySingleton<AccountBalanceBloc>(() => AccountBalanceBloc(sl()));

  sl.registerLazySingleton<CategoryCashflowBloc>(() => CategoryCashflowBloc(dataRepository: sl()));

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

  sl.registerFactory(() => AccountDetailBloc(sl<DataRepository>()));
  sl.registerFactory(() => AccountInputBloc(sl<DataRepository>()));

  sl.registerFactory(() => BudgetBloc(sl<DataRepository>()));
  sl.registerFactory(() => CategoryDetailBloc(sl<DataRepository>()));
  sl.registerFactory(() => CategoryInputBloc(sl<DataRepository>()));

  sl.registerFactory(() => LastOperationsBloc(sl<DataRepository>()));

  sl.registerFactory(() => OperationEditBloc(sl<DataRepository>()));
  sl.registerFactory(() => MasterBloc(sl<DataRepository>()));
  sl.registerFactory(() => OperationFilterBloc(sl<DataRepository>()));
  sl.registerFactory(() => OperationListBloc(sl<DataRepository>()));
  sl.registerFactory(() => ReportsBloc(sl<DataRepository>()));
  sl.registerFactory(() => DataControlBloc(sl<BackupRepository>()));
}
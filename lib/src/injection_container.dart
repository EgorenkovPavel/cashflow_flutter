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
import 'package:money_tracker/src/domain/use_cases/delete_operation_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/get_account_by_id_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/get_category_by_id_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/get_last_operation_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/get_operation_by_id_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_account_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_input_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_account_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_operation_input_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_account_title_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_balances_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_cashflow_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_category_by_id_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_last_operations_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_operations_by_account_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_operations_by_category_use_case.dart';
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
import '../src/domain/interfaces/sync_repository.dart';
import '../src/ui/pages/account/detail_page/account_detail_bloc.dart';
import '../src/ui/pages/account/input_page/account_input_bloc.dart';
import '../src/ui/pages/budget_page/budget_bloc.dart';
import '../src/ui/pages/category/detail_page/category_detail_bloc.dart';
import '../src/ui/pages/category/input_page/category_input_bloc.dart';
import '../src/ui/pages/operation/edit_page/operation_edit_bloc.dart';
import '../src/ui/pages/operation/filter_page/operation_filter_bloc.dart';
import '../src/ui/pages/operation/list_page/operation_list_bloc.dart';
import '../src/ui/pages/reports/reports_bloc.dart';
import '../src/ui/pages/service/data_control_page/data_control_bloc.dart';
import '../src/ui/pages/service/drive_dialog/drive_dialog_bloc.dart';
import '../src/ui/pages/service/google_drive_settings_page/google_drive_settings_bloc.dart';
import 'data/sources/local/data/user_dao.dart';
import 'domain/interactors/category_interactor.dart';
import 'domain/interfaces/data_repository.dart';
import 'domain/use_cases/insert_operation_output_use_case.dart';
import 'domain/use_cases/insert_operation_transfer_use_case.dart';
import 'domain/use_cases/update_operation_output_use_case.dart';
import 'domain/use_cases/update_operation_transfer_use_case.dart';
import 'ui/pages/home/home_page_cards/last_operations/last_operations_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  sl.registerLazySingleton<Database>(() => Database());
  sl.registerLazySingleton<AccountDao>(() => AccountDao(sl<Database>()));
  sl.registerLazySingleton<CategoryDao>(() => CategoryDao(sl<Database>()));
  sl.registerLazySingleton<OperationDao>(() => OperationDao(sl<Database>()));
  sl.registerLazySingleton<UserDao>(() => UserDao(sl<Database>()));

  sl.registerLazySingleton<LocalSyncTable<Account>>(
    () => AccountDataRepositoryImpl(sl<AccountDao>(), sl<UserDao>()),
  );
  sl.registerLazySingleton<LocalSyncTable<Category>>(
    () => CategoryDataRepositoryImpl(sl<CategoryDao>()),
  );
  sl.registerLazySingleton<LocalSyncTable<Operation>>(
    () => OperationDataRepositoryImpl(sl<OperationDao>(), sl<UserDao>()),
  );

  sl.registerLazySingleton<DataRepository>(() => DataRepositoryImpl(
        accountDao: sl<AccountDao>(),
        categoryDao: sl<CategoryDao>(),
        operationDao: sl<OperationDao>(),
        userDao: sl<UserDao>(),
      ));

  sl.registerLazySingleton<LocalSyncSource>(() => LocalSyncSourceImpl(
        accountRepo: sl<LocalSyncTable<Account>>(),
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

  sl.registerFactory(() => WatchAccountTitleUseCase(sl()));
  sl.registerFactory(() => WatchCategoryByIdUseCase(sl()));

  sl.registerFactory(() => WatchOperationsByAccountUseCase(sl()));
  sl.registerFactory(() => WatchOperationsByCategoryUseCase(sl()));

  sl.registerFactory(() => WatchBalancesUseCase(sl()));
  sl.registerFactory(() => WatchCashflowUseCase(sl()));

  sl.registerFactory(() => GetAccountByIdUseCase(sl()));
  sl.registerFactory(() => GetCategoryByIdUseCase(sl()));
  sl.registerFactory(() => GetOperationByIdUseCase(sl()));

  sl.registerFactory(() => GetLastOperationUseCase(sl()));
  sl.registerFactory(() => WatchLastOperationsUseCase(sl()));

  sl.registerFactory(() => InsertAccountUseCase(sl(), sl()));

  sl.registerFactory(() => InsertOperationInputUseCase(sl()));
  sl.registerFactory(() => InsertOperationOutputUseCase(sl()));
  sl.registerFactory(() => InsertOperationTransferUseCase(sl()));

  sl.registerFactory(() => UpdateAccountUseCase(sl()));

  sl.registerFactory(() => UpdateOperationInputUseCase(sl()));
  sl.registerFactory(() => UpdateOperationOutputUseCase(sl()));
  sl.registerFactory(() => UpdateOperationTransferUseCase(sl()));

  sl.registerFactory(() => DeleteOperationUseCase(sl()));

  sl.registerFactory(() => CategoryInteractor(sl()));

  // BLOCs

  sl.registerLazySingleton(() => AuthBloc(sl<AuthRepository>()));

  sl.registerLazySingleton(() => SyncBloc(
        authBloc: sl<AuthBloc>(),
        prefsRepository: sl<SettingsSource>(),
        syncRepo: sl<SyncRepository>(),
      ));

  sl.registerLazySingleton(() => AccountBalanceBloc(sl()));

  sl.registerLazySingleton(() => CategoryCashflowBloc(sl()));

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
        sl<WatchAccountTitleUseCase>(),
        sl<WatchOperationsByAccountUseCase>(),
      ));
  sl.registerFactory(() => AccountInputBloc(
        sl<GetAccountByIdUseCase>(),
        sl<InsertAccountUseCase>(),
        sl<UpdateAccountUseCase>(),
      ));

  sl.registerFactory(() => BudgetBloc(sl<DataRepository>()));

  sl.registerFactory(() => CategoryDetailBloc(
        sl<WatchOperationsByCategoryUseCase>(),
        sl<WatchCategoryByIdUseCase>(),
      ));
  sl.registerFactory(() => CategoryInputBloc(
        sl<CategoryInteractor>(),
      ));

  sl.registerFactory(
      () => LastOperationsBloc(sl<WatchLastOperationsUseCase>()));

  sl.registerFactory(
      () => OperationEditBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => MasterBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => OperationFilterBloc());
  sl.registerFactory(() => OperationListBloc(sl<DataRepository>()));
  sl.registerFactory(() => ReportsBloc(sl<DataRepository>()));
  sl.registerFactory(() => DataControlBloc(sl<BackupRepository>()));
}

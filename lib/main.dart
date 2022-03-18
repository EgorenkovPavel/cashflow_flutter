import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore_for_file: unused_import
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/internet_connection_bloc.dart'
    as internet_connection;
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/data/repositories/sync_repository_impl.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/data/sources/local/database_source.dart';
import 'package:money_tracker/data/sources/network_info.dart';
import 'package:money_tracker/data/sources/auth_source_impl.dart';
import 'package:money_tracker/data/repositories/data_repository_impl.dart';
import 'package:money_tracker/data/sources/backup_source.dart';
import 'package:money_tracker/data/sources/remote/firecloud_source.dart';
import 'package:money_tracker/data/sources/settings_source.dart';
import 'package:money_tracker/data/sources/auth_source.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/interfaces/sync_repository.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final db = Database();
  final _databaseSource = DatabaseSource(db);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final _firestore = FirebaseFirestore.instance;
  _firestore.settings = const Settings(persistenceEnabled: false);

  final AuthSource _authRepository = GoogleAuth();
  //final _driveRepository = GoogleDrive();

  final _cloudSource = FirecloudSource(_firestore);

  final _prefs = await SharedPreferences.getInstance();

  final _prefsRepo = SharedPrefs(_prefs);

  final _dataSource = DataRepositoryImpl(_databaseSource);

  final NetworkInfo _networkInfo = NetworkInfoImpl(Connectivity());

  final SyncRepository _syncRepo = SyncRepositoryImpl(_cloudSource, _databaseSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              internet_connection.InternetConnectionBloc(_networkInfo)
                ..add(internet_connection.Init()),
          lazy: false,
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AuthBloc(
            _authRepository,
            context.read<internet_connection.InternetConnectionBloc>(),
            _dataSource,
            _syncRepo,
          )..add(Init()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SyncBloc(
            authBloc: context.read<AuthBloc>(),
            dataSource: _dataSource,
            prefsRepository: _prefsRepo,
            syncRepo: _syncRepo,
          ),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<DataRepository>(create: (_) => _dataSource),
          RepositoryProvider<SharedPrefs>(create: (_) => _prefsRepo),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

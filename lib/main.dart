import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/auth_repository.dart';
import 'package:money_tracker/data/cloud/firecloud_source.dart';
import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/data/local/database_source.dart';
import 'package:money_tracker/data/drive_repository.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/internet_connection_bloc.dart';
import 'package:money_tracker/sync_bloc.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_repository.dart';

Future<void> main() async {
  final db = Database();
  final _databaseSource = DatabaseSource(db);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final _firestore = FirebaseFirestore.instance;
  _firestore.settings = Settings(persistenceEnabled: false);

  final _authRepository = AuthRepository();
  final _driveRepository = DriveRepository();

  final _cloudSource = FirecloudSource(_firestore);

  final _dataRepository = DataRepository(
    databaseSource: _databaseSource,
    cloudSource: _cloudSource,
  );

  final _prefs = await SharedPreferences.getInstance();

  final _prefsRepo = PrefsRepository(_prefs);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConnectionBloc(),
          lazy: false,
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AuthBloc(
            repository: _authRepository,
            connectionBloc: context.read<InternetConnectionBloc>(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SyncBloc(
            authBloc: context.read<AuthBloc>(),
            dataRepository: _dataRepository,
            prefsRepository: _prefsRepo,
          ),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<DataRepository>(create: (_) => _dataRepository),
          RepositoryProvider<DriveRepository>(create: (_) => _driveRepository),
        ],
        child: MyApp(),
      ),
    ),
  );
}

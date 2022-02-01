import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/data/auth_repository.dart';
import 'package:money_tracker/data/auth_source.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/remote/firecloud_source.dart';
import 'package:money_tracker/data/local/data/database.dart';
import 'package:money_tracker/data/local/database_source.dart';
import 'package:money_tracker/data/drive_repository.dart';
import 'package:money_tracker/data/prefs_repository.dart';
import 'package:money_tracker/common_blocs/internet_connection_bloc.dart' as InternetConnection;
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore_for_file: unused_import
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> main() async {
  final db = Database();
  final _databaseSource = DatabaseSource(db);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final _firestore = FirebaseFirestore.instance;
  _firestore.settings = Settings(persistenceEnabled: false);

  final AuthSource _authRepository = AuthRepository();
  final _driveRepository = DriveRepository();

  final _cloudSource = FirecloudSource(_firestore);

  final _prefs = await SharedPreferences.getInstance();

  final _prefsRepo = PrefsRepository(_prefs);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConnection.InternetConnectionBloc()..add(InternetConnection.Init()),
          lazy: false,
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AuthBloc(
            _authRepository,
            context.read<InternetConnection.InternetConnectionBloc>(),
          )..add(Init()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SyncBloc(
            authBloc: context.read<AuthBloc>(),
            localSource: _databaseSource,
            remoteSource: _cloudSource,
            prefsRepository: _prefsRepo,
          ),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LocalSource>(create: (_) => _databaseSource),
          RepositoryProvider<DriveRepository>(create: (_) => _driveRepository),
          RepositoryProvider<PrefsRepository>(create: (_) => _prefsRepo),
        ],
        child: MyApp(),
      ),
    ),
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/data/auth_repository.dart';
import 'package:money_tracker/data/cloud/cloud_source.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/database/database_source.dart';
import 'package:money_tracker/data/drive_repository.dart';
import 'package:money_tracker/data/prefs_repository.dart';
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

  final _authRepository = AuthRepository();
  final _driveRepository = DriveRepository();

  final _cloudSource = CloudSource(_firestore);

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
            lazy: false,
            create: (context) => AuthBloc(_authRepository)
              ..stream.listen((state) async {
                if (state.inProgress) {
                  return;
                } else if (state.isAuthenticated) {
                  _driveRepository.logIn(state.client!);
                } else if (!state.isAuthenticated) {
                  _driveRepository.logOut();
                }
              })),
        BlocProvider(
            lazy: false,
            create: (context) => SyncBloc(
                  context.read<AuthBloc>(),
                  _dataRepository,
                  _prefsRepo,
                )),
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

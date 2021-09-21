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
import 'package:money_tracker/ui/app.dart';

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

  final _repository = DataRepository(
    databaseSource: _databaseSource,
    cloudSource: _cloudSource,
  );

  runApp(
    BlocProvider(
      lazy: false,
      create: (context) => AuthBloc(_authRepository)
        ..stream.listen((state) {
          print('auth ${state.isAuthenticated} progress ${state.inProgress}');
          if (state.inProgress) {
            return;
          } else if (state.isAuthenticated) {
            _repository.logIn(state.userId);
            _driveRepository.logIn(state.client!);
          } else if (!state.isAuthenticated) {
            _repository.logOut();
            _driveRepository.logOut();
          }
        }),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<DataRepository>(create: (_) => _repository),
          RepositoryProvider<DriveRepository>(create: (_) => _driveRepository),
        ],
        child: MyApp(),
      ),
    ),
  );
}

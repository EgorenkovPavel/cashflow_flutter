import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/auth.dart';
import 'package:money_tracker/data/cloud/cloud_source.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/database/database_source.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:money_tracker/ui/pages/operation/filter_page/operation_filter_page_bloc.dart';
import 'package:money_tracker/ui/pages/service/settings_page/settings_page_bloc.dart';
import 'package:provider/provider.dart';

import 'data/repository.dart';

Future<void> main() async {
  final db = Database();

  final _databaseSource = DatabaseSource(db);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final _firestore = FirebaseFirestore.instance;
  final _cloudSource = CloudSource(_firestore, 'USER_ID');
  final _userRepository = UserRepository();

  final _repository = Repository(
      databaseSource: _databaseSource,
      cloudSource: _cloudSource,
      userRepository: _userRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsPageBloc>(
          create: (BuildContext context) => SettingsPageBloc(_repository),
        ),
        BlocProvider<OperationFilterPageBloc>(
          create: (BuildContext context) =>
              OperationFilterPageBloc(_repository),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _repository),
        ],
        child: MyApp(),
      ),
    ),
  );
}

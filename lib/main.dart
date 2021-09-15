import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/data/auth.dart';
import 'package:money_tracker/data/cloud/cloud_source.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/database/database_source.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:provider/provider.dart';

import 'data/repository.dart';

Future<void> main() async {
  final db = Database();

  final _databaseSource = DatabaseSource(db);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final _firestore = FirebaseFirestore.instance;
  final _userRepository = UserRepository();

  await _userRepository.authenticate();
  var userId = await _userRepository.getUserId();

  final _cloudSource = CloudSource(_firestore, userId!);

  final _repository = Repository(
      databaseSource: _databaseSource,
      cloudSource: _cloudSource,
      userRepository: _userRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _repository),
      ],
      child: MyApp(),
    ),
  );
}

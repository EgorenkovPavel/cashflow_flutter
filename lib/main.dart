import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/account_repository.dart';
import 'package:money_tracker/data/category_repository.dart';
import 'package:money_tracker/data/cloud_source.dart';
import 'package:money_tracker/data/database/account_dao.dart';
import 'package:money_tracker/data/database/category_dao.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/database/operation_dao.dart';
import 'package:money_tracker/data/operation_repository.dart';
import 'package:money_tracker/data/service_repository.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:money_tracker/ui/pages/operation/filter_page/operation_filter_page_bloc.dart';
import 'package:money_tracker/ui/pages/service/settings_page/settings_page_bloc.dart';
import 'package:provider/provider.dart';

import 'data/repository.dart';

Future<void> main() async {
  final db = Database();

  final _accountRepo = AccountRepository(AccountDao(db));
  final _categoryRepo = CategoryRepository(CategoryDao(db));
  final _operationRepo = OperationRepository(OperationDao(db));
  final _serviceRepo = ServiceRepository(db);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _firestore = FirebaseFirestore.instance;
  final _cloudSource = CloudSource(_firestore);

  final _repository =
      Repository(_accountRepo, _categoryRepo, _operationRepo, _serviceRepo, _cloudSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BackupPageBloc>(
          create: (BuildContext context) => BackupPageBloc(_repository),
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

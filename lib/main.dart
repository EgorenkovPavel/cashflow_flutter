import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/account_repository.dart';
import 'package:money_tracker/data/budget_repository.dart';
import 'package:money_tracker/data/category_repository.dart';
import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/operation_repository.dart';
import 'package:money_tracker/data/service_repository.dart';
import 'package:money_tracker/domain/theme_model.dart';
import 'package:money_tracker/ui/app.dart';
import 'package:money_tracker/ui/pages/account/account_edit_page.dart';
import 'package:money_tracker/ui/pages/account/account_input_page.dart';
import 'package:money_tracker/ui/pages/budget/budget_card.dart';
import 'package:money_tracker/ui/pages/category/category_input_page.dart';
import 'package:money_tracker/ui/pages/operation/operation_input_bloc.dart';
import 'package:money_tracker/ui/pages/service/settings_page.dart';
import 'package:provider/provider.dart';

import 'data/repository.dart';

void main() {
  final db = Database();

  final _accountRepo = AccountRepository(db);
  final _categoryRepo = CategoryRepository(db);
  final _operationRepo = OperationRepository(db);
  final _budgetRepo = BudgetRepository(db);
  final _serviceRepo = ServiceRepository(db);

  final _repository = Repository(
      _accountRepo, _categoryRepo, _operationRepo, _budgetRepo, _serviceRepo);

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AccountCardBloc>(
          create: (BuildContext context) => AccountCardBloc(_repository),
        ),
        BlocProvider<CategoryCardBloc>(
          create: (BuildContext context) => CategoryCardBloc(_repository),
        ),
        BlocProvider<BudgetCardBloc>(
          create: (BuildContext context) => BudgetCardBloc(_repository),
        ),
        BlocProvider<AccountEditPageBloc>(
          create: (BuildContext context) => AccountEditPageBloc(_repository),
        ),
        BlocProvider<BackupPageBloc>(
          create: (BuildContext context) => BackupPageBloc(_repository),
        ),
        BlocProvider<MasterBloc>(
          create: (BuildContext context) => MasterBloc(_repository),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _repository),
          ChangeNotifierProvider(create: (context) => ThemeModel())
        ],
        child: MyApp(),
      ),
    ),
  );
}

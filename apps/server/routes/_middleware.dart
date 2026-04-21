import 'package:cashflow_server/data/database.dart';
import 'package:cashflow_server/data_repository_impl.dart';
import 'package:cashflow_server/user_service.dart';
import 'package:dart_frog/dart_frog.dart';

final database = AppDatabase();

Middleware dataProvider() =>
    provider<DataRepositoryImpl>((context) => DataRepositoryImpl(database));

Middleware userService() => provider<UserService>(
  (context) => UserService(dataRepository: context.read<DataRepositoryImpl>()),
);

Handler middleware(Handler handler) =>
    handler.use(requestLogger()).use(userService()).use(dataProvider());

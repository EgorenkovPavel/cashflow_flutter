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

Middleware corsConflictResolver() {
  return (handler) {
    return (context) async {
      // 1. Обрабатываем preflight-запросы (OPTIONS), которые браузер шлет перед основным запросом
      if (context.request.method == HttpMethod.options) {
        return Response(
          statusCode: 204, // No Content
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods':
                'GET, POST, PUT, DELETE, PATCH, OPTIONS',
            'Access-Control-Allow-Headers':
                'Origin, X-Requested-With, Content-Type, Accept, Authorization',
          },
        );
      }

      // 2. Передаем запрос дальше к вашим эндпоинтам
      final response = await handler(context);

      // 3. Добавляем заголовки CORS к итоговому ответу сервера
      return response.copyWith(
        headers: {
          ...response.headers,
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods':
              'GET, POST, PUT, DELETE, PATCH, OPTIONS',
          'Access-Control-Allow-Headers':
              'Origin, X-Requested-With, Content-Type, Accept, Authorization',
        },
      );
    };
  };
}

Handler middleware(Handler handler) => handler
    .use(requestLogger())
    .use(userService())
    .use(dataProvider())
    .use(corsConflictResolver());

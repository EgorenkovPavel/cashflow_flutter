import 'package:cashflow_server/models/user.dart';
import 'package:cashflow_server/user_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';

Handler middleware(Handler handler) {
  return handler.use(
    bearerAuthentication<User>(authenticator: (context, idToken) async {
      final userService = context.read<UserService>();
      return userService.find(idToken);
    }),
  );
}

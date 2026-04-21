import 'package:cashflow_server/user_service.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {

  final userService = context.read<UserService>();
  
  final auth = context.request.headers['Authorization'];
  if (auth == null || !auth.startsWith('Bearer ')){
    return Response(statusCode: 400, body: 'No Authorization Bearer header');
  }
  
  final token = auth.substring(7);

  final user = await userService.register(token);
  if (user == null){
    return Response(statusCode: 500);
  }else{
    return Response.json(body: user);
  }

}

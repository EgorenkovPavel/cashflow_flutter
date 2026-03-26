import 'dart:convert';

import 'package:cashflow_server/data_repository_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(
  RequestContext context,
  String groupId,
) async {
  // switch(context.request.method){
  //   case HttpMethod.post:{};
  //   default:
  //     // TODO: Handle this case.
  //     throw UnimplementedError();
  // }

  final jsonData = jsonDecode(await context.request.body());

  if (jsonData
      case {
        'name': final String name,
        'isDebt': final bool isDebt,
        'userId': final String userId,
      }) {
    final dataRepository = context.read<DataRepositoryImpl>();
    final account = await dataRepository.createAccount(
      name: name,
      isDebt: isDebt,
      userId: userId,
      groupId: groupId,
    );
    return Response.json(body: account);
  } else {
    throw UnimplementedError();
  }
}

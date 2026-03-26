import 'package:cashflow_server/data_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(
  RequestContext context,
  String groupId,
) async {
  final dataRepository = context.read<DataRepository>();

  final users = await dataRepository.getAllUsersByGroup(groupId);

  return Response.json(body: users);
}

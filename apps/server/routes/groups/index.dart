import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

import '../../lib/data_repository.dart';

Future<Response> onRequest(RequestContext context) async {

  return Response(body: 'This is a new route!');
}

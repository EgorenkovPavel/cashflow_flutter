library spring;

import 'package:spring/models/models.dart';

import 'services/account_service.dart';
import 'services/account_service_impl.dart';
import 'services/category_service.dart';
import 'services/category_service_impl.dart';
import 'services/network_client.dart';
import 'services/operation_service.dart';
import 'services/operation_service_impl.dart';


/*
final c = SpringConnector(token);
c.connect();
c.accounts.getAll();
 */

class SpringConnector {

  late NetworkClient _networkClient;
  late AccountService _accountService;
  late CategoryService _categoryService;
  late OperationService _operationService;

  SpringConnector(String token) {
    _networkClient = NetworkClient(token);
    _accountService = AccountServiceImpl(_networkClient);
    _categoryService = CategoryServiceImpl(_networkClient);
    _operationService = OperationServiceImpl(_networkClient);
  }

  set token(String token) {
    _networkClient.token = token;
  }

  AccountService get accounts => _accountService;

  CategoryService get categories => _categoryService;

  OperationService get operations => _operationService;

  Future<List<UserGroup>> userGroups() => _networkClient.get<List<UserGroup>>('user-groups');

}





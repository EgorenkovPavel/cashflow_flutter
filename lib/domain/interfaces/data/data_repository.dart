
import 'account_data_repository.dart';
import 'category_data_repository.dart';
import 'operation_data_repository.dart';

abstract class DataRepository {
  AccountDataRepository get accounts;

  CategoryDataRepository get categories;

  OperationDataRepository get operations;

}







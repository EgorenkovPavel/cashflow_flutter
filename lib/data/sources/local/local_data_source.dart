
import '../../../domain/interfaces/data/account_data_repository.dart';
import '../../../domain/interfaces/data/category_data_repository.dart';
import '../../../domain/interfaces/data/operation_data_repository.dart';

abstract class LocalDataSource{

  AccountDataRepository get accounts;
  CategoryDataRepository get categories;
  OperationDataRepository get operations;

  Future deleteAll();
  Future<Map<String, List<Map<String, dynamic>>>> exportData();
  Future<void> importData(Map<String, dynamic> data);

}

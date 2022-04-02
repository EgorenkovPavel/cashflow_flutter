import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class LocalDataSource{

  AccountDataRepository get accounts;
  CategoryDataRepository get categories;
  OperationDataRepository get operations;

  Future deleteAll();
  Future<Map<String, List<Map<String, dynamic>>>> exportData();
  Future<void> importData(Map<String, dynamic> data);

}

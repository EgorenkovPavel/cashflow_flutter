import 'package:money_tracker/data/sources/local/local_data_source.dart';

import '../../domain/interfaces/data/account_data_repository.dart';
import '../../domain/interfaces/data/category_data_repository.dart';
import '../../domain/interfaces/data/data_repository.dart';
import '../../domain/interfaces/data/operation_data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  final LocalDataSource _localSource;

  DataRepositoryImpl(this._localSource);

  @override
  AccountDataRepository get accounts => _localSource.accounts;

  @override
  CategoryDataRepository get categories => _localSource.categories;

  @override
  OperationDataRepository get operations => _localSource.operations;

  @override
  Future deleteAll() => _localSource.deleteAll();

  @override
  Future<Map<String, List<Map<String, dynamic>>>> exportData() =>
      _localSource.exportData();

  @override
  Future importData(Map<String, dynamic> data) => _localSource.importData(data);
}

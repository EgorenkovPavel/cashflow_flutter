import 'package:money_tracker/data/sources/local/local_source.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  final LocalSource _localSource;

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

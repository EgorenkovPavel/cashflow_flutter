import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/data/remote/remote_source.dart';

class DataRepository implements DataSource{
  final LocalSource _localSource;
  final RemoteSource _remoteSource;

  DataRepository(this._localSource, this._remoteSource);

  @override
  AccountDataSource get accounts => _localSource.accounts;

  @override
  CategoryDataSource get categories => _localSource.categories;

  @override
  OperationDataSource get operations => _localSource.operations;

  @override
  Future deleteAll() {
    return _localSource.deleteAll();
  }

  @override
  Future<Map<String, List<Map<String, dynamic>>>> exportData() {
    return _localSource.exportData();
  }

  @override
  Future importData(Map<String, dynamic> data) {
    return _localSource.importData(data);
  }
}
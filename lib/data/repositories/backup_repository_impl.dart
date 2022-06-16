import 'package:money_tracker/data/sources/backup_source.dart';
import 'package:money_tracker/domain/interfaces/backup_repository.dart';
import 'package:money_tracker/domain/models/google_drive_file.dart';

import '../sources/local/local_data_source.dart';

class BackupRepositoryImpl implements BackupRepository {
  final BackupSource _backupSource;
  final LocalDataSource _localSource;

  BackupRepositoryImpl({
    required BackupSource backupSource,
    required LocalDataSource localSource,
  }) : _backupSource = backupSource, _localSource = localSource;

  @override
  Future<void> backup(
    Map<String, List<Map<String, dynamic>>> data,
    String catalogId,
    String fileName,
  ) {
    return _backupSource.backup(
      data,
      catalogId,
      fileName,
    );
  }

  @override
  Future<List<DriveFile>> getFiles(String catalogId) {
    return _backupSource.getFiles(catalogId);
  }

  @override
  Future<Map<String, dynamic>?> restore(String fileId) {
    return _backupSource.restore(fileId);
  }

  @override
  Future deleteAll() => _localSource.deleteAll();

  @override
  Future<Map<String, List<Map<String, dynamic>>>> exportData() =>
      _localSource.exportData();

  @override
  Future importData(Map<String, dynamic> data) => _localSource.importData(data);
}

import 'package:money_tracker/data/sources/backup_source.dart';
import 'package:money_tracker/domain/interfaces/backup_repository.dart';
import 'package:money_tracker/domain/models/google_drive_file.dart';

import '../sources/local/local_backup_source.dart';

class BackupRepositoryImpl implements BackupRepository {
  final LocalBackupSource _localSource;

  BackupRepositoryImpl({
    required LocalBackupSource localSource,
  }) :  _localSource = localSource;

  @override
  Future deleteAll() => _localSource.deleteAll();

  @override
  Future<Map<String, List<Map<String, dynamic>>>> exportData() =>
      _localSource.exportData();

  @override
  Future importData(Map<String, dynamic> data) => _localSource.importData(data);
}

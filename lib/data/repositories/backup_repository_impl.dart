import 'package:money_tracker/data/sources/backup_source.dart';
import 'package:money_tracker/domain/interfaces/backup_repository.dart';
import 'package:money_tracker/domain/models/google_drive_file.dart';

class BackupRepositoryImpl implements BackupRepository{

  final BackupSource _backupSource;

  BackupRepositoryImpl(this._backupSource);

  @override
  Future<void> backup(Map<String, List<Map<String, dynamic>>> data, String catalogId, String fileName) {
    return _backupSource.backup(data, catalogId, fileName);
  }

  @override
  Future<List<DriveFile>> getFiles(String catalogId) {
    return _backupSource.getFiles(catalogId);
  }

  @override
  Future<Map<String, dynamic>?> restore(String fileId) {
    return _backupSource.restore(fileId);
  }

}
import 'package:money_tracker/domain/models/google_drive_file.dart';

abstract class BackupRepository {
  Future<void> backup(
    Map<String, List<Map<String, dynamic>>> data,
    String catalogId,
    String fileName,
  );

  Future<Map<String, dynamic>?> restore(String fileId);

  Future<List<DriveFile>> getFiles(String catalogId);

  Future<void> deleteAll();

  Future<Map<String, List<Map<String, dynamic>>>> exportData();

  Future<void> importData(Map<String, dynamic> data);
}

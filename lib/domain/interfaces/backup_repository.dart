
import 'package:money_tracker/domain/models/google_drive_file.dart';

abstract class BackupRepository{

  Future<void> backup(Map<String, List<Map<String, dynamic>>> data,
      String catalogId, String fileName);

  Future<Map<String, dynamic>?> restore(String fileId);

  Future<List<DriveFile>> getFiles(String catalogId);

}
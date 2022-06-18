import 'package:money_tracker/domain/models/google_drive_file.dart';

abstract class BackupRepository {

  Future<void> deleteAll();

  Future<Map<String, List<Map<String, dynamic>>>> exportData();

  Future<void> importData(Map<String, dynamic> data);
}

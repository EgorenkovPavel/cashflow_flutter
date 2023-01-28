
abstract class BackupRepository {

  Future<void> deleteAll();

  Future<Map<String, List<Map<String, dynamic>>>> exportData();

  Future<void> importData(Map<String, dynamic> data);
}

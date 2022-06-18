abstract class LocalBackupSource{

  Future deleteAll();
  Future<Map<String, List<Map<String, dynamic>>>> exportData();
  Future<void> importData(Map<String, dynamic> data);

}
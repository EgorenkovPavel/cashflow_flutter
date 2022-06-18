import 'package:money_tracker/data/sources/local/local_backup_source.dart';

import 'data/database.dart';

class LocalBackupSourceImpl extends LocalBackupSource{

  final Database db;

  LocalBackupSourceImpl(this.db);

  @override
  Future<void> deleteAll() => db.deleteAll();

  @override
  Future<Map<String, List<Map<String, dynamic>>>> exportData() => db.getDbData();

  @override
  Future importData(Map<String, dynamic> data) async {
    await deleteAll();

    return db.loadData(data);
  }

}
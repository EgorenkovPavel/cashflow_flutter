import 'package:money_tracker/src/domain/interfaces/backup_repository.dart';

import '../sources/local/data/database.dart';

class BackupRepositoryImpl implements BackupRepository {
  final Database db;

  BackupRepositoryImpl(this.db);

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



abstract class SyncService {

  Future<int> uploadToCloud();

  Future<int> downloadFromCloud(DateTime date);
}

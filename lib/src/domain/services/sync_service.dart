import '../models/account/account.dart';
import '../models/user.dart';

abstract class SyncService {

  Future<int> uploadToCloud();

  Future<int> downloadFromCloud(DateTime date);
}

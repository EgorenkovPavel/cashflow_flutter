import 'package:money_tracker/src/common_blocs/sync/loading_state.dart';
import 'package:money_tracker/src/domain/models.dart';
import '../../utils/result.dart';

abstract interface class SyncRepository{

  Stream<LoadingState> downloadFromCloud(DateTime date);
  Stream<LoadingState> uploadToCloud();

  Stream<bool> connectedToInternet();

  Result<bool> isCurrentAdmin();
  Future<Result<List<User>>> getAllUsers();
  Future<void> logIn(User user);
  Future<void> logOut();
  Future<void> addToDatabase(User user);
  Future<void> createDatabase({required User admin});
  Future<bool> databaseExists({required User admin});

}
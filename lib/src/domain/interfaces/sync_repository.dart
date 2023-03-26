import 'package:money_tracker/src/common_blocs/sync/loading_state.dart';
import 'package:money_tracker/src/domain/models/user.dart';

abstract class SyncRepository{

  Stream<LoadingState> downloadFromCloud(DateTime date);
  Stream<LoadingState> uploadToCloud();

  Stream<bool> connectedToInternet();

  bool isCurrentAdmin();
  Future<List<User>> getAllUsers();
  Future<void> logIn(User user);
  Future<void> logOut();
  Future<void> addToDatabase(User user);
  Future<void> createDatabase({required User admin});
  Future<bool> databaseExists({required User admin});

}
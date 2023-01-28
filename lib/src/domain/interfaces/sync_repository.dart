import 'package:money_tracker/src/common_blocs/sync/loading_state.dart';
import 'package:money_tracker/src/domain/models/user.dart';
import 'package:money_tracker/src/utils/try.dart';

abstract class SyncRepository{

  Stream<LoadingState> loadFromCloud(DateTime date);
  Stream<LoadingState> loadToCloud();

  Stream<bool> connectedToInternet();

  Try<bool> isCurrentAdmin();
  Future<Try<List<User>>> getAllUsers();
  Future<Try<void>> logIn(User user);
  Future<void> logOut();
  Future<Try<void>> addToDatabase(User user);
  Future<Try<void>> createDatabase({required User admin});
  Future<Try<bool>> databaseExists({required User admin});

}
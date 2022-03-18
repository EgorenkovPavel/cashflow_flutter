import 'package:money_tracker/common_blocs/sync/syncer/loading_state.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/utils/try.dart';

abstract class SyncRepository{

  Stream<LoadingState> loadFromCloud(DateTime date);
  Stream<LoadingState> loadToCloud();

  Future<bool> isAdmin(User user);
  Future<Try<List<User>>> getAll();
  Future<Try<void>> logIn(User user);
  Future<void> logOut();
  Future<Try<void>> addToDatabase(User user);
  Future<Try<void>> createDatabase(User user);
  Future<Try<bool>> databaseExists(User user);

}
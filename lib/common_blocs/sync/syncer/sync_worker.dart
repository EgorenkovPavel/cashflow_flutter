import 'package:money_tracker/common_blocs/sync/syncer/loading_state.dart';

abstract class SyncWorker{
  Stream<LoadingState> loadFromCloud(DateTime date);
  Stream<LoadingState> loadToCloud();
}
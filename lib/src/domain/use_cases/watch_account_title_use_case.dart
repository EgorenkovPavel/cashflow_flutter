import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

class WatchAccountTitleUseCase {
  final DataRepository _dataRepository;

  WatchAccountTitleUseCase(this._dataRepository);

  Stream<String> call({required int accountId}) => _dataRepository.accounts
      .watchById(accountId)
      .map((account) => account.title);
}

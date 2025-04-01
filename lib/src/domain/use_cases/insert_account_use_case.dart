import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

import '../models.dart';

class InsertAccountUseCase {
  final DataRepository _dataRepository;

  InsertAccountUseCase(this._dataRepository);

  Future<BaseAccount> call({
    required String title,
    required bool isDebt,
    required int? userId,
  }) async {

    if (isDebt){
      final account = Debt(
        title: title,
        userId: userId,
      );
      final id = await _dataRepository.insertAccount(account);

      return account.copyWith(id: id);
    }else{
      final account = Account(
        title: title,
        userId: userId,
      );
      final id = await _dataRepository.insertAccount(account);

      return account.copyWith(id: id);
    }


  }
}

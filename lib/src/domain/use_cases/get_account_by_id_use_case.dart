import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import '../models.dart';

class GetAccountByIdUseCase{
  final DataRepository _dataRepository;

  GetAccountByIdUseCase(this._dataRepository);

  Future<Account> call({required int accountId}) => _dataRepository.accounts.getById(accountId);
}
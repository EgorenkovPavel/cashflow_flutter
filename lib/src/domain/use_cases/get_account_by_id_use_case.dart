import '../interfaces/data_repository.dart';
import '../models.dart';

class GetAccountByIdUseCase{
  final DataRepository _dataRepository;

  GetAccountByIdUseCase(this._dataRepository);

  Future<BaseAccount> call({required int accountId}) => _dataRepository.getAccountById(accountId);
}
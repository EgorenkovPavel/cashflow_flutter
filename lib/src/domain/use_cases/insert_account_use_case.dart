import 'package:money_tracker/src/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';
import '../models.dart';

class InsertAccountUseCase {
  final DataRepository _dataRepository;
  final AuthRepository _authRepository; //TODO где брать актаульную инфо и user? из базы или из аутентификации

  InsertAccountUseCase(this._dataRepository, this._authRepository);

  Future<Account> call({
    required String title,
    required bool isDebt,
    //required User? user,//TODO
  }) async {

    final authUser = await _authRepository.getUser();
    var user;
    if (authUser == null){
      user = null;
    }else {
      user = await _dataRepository.getUserByGoogleId(authUser.googleId);
    }

    final account = Account(
      title: title,
      user: user,
    );
    final id = await _dataRepository.insertAccount(account);

    return account.copyWith(id: id);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class AccountInputPageState {}

class Close extends AccountInputPageState {
  final Account account;

  Close({required this.account});
}

class InitTitle extends AccountInputPageState {
  final String title;

  InitTitle({required this.title});
}

class Data extends AccountInputPageState {
  final bool isDebt;

  Data({required this.isDebt});
}

class AccountInputPageBloc extends Cubit<AccountInputPageState> {
  final LocalSource _repository;

  Account? _account;
  String _title = '';
  bool _isDebt = false;

  AccountInputPageBloc(this._repository) : super(Data(isDebt: false));

  Future<void> fetch(int id) async {
    _account = await _repository.accounts.getById(id);
    _title = _account!.title;
    _isDebt = _account!.isDebt;

    emit(InitTitle(title: _title));

    emit(Data(isDebt: _isDebt));
  }

  void changeTitle(String title) {
    _title = title;
  }

  void changeIsDebt(bool val) {
    _isDebt = val;
    emit(Data(isDebt: _isDebt));
  }

  Future<void> save() async {
    if (_account == null) {
      var account = Account(title: _title, isDebt: _isDebt);
      var _id = await _repository.accounts.insert(account);
      emit(Close(account: account.copyWith(id: _id)));
    } else {
      var _newAccount = _account!.copyWith(title: _title, isDebt: _isDebt);
      await _repository.accounts.update(_newAccount);
      emit(Close(account: _newAccount));
    }
  }
}

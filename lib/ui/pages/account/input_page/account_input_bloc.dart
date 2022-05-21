import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class AccountInputEvent {}

class Fetch extends AccountInputEvent {
  final int accountId;

  Fetch(this.accountId);
}

class ChangeTitle extends AccountInputEvent {
  final String title;

  ChangeTitle(this.title);
}

class ChangeIsDebt extends AccountInputEvent {
  final bool isDebt;

  ChangeIsDebt(this.isDebt);
}

class Save extends AccountInputEvent {}

abstract class AccountInputState {
  final String title;
  final bool isDebt;
  final Account? account;

  AccountInputState({
    required this.title,
    required this.isDebt,
    required this.account,
  });
}

class SavedAccount extends AccountInputState {
  SavedAccount({
    required AccountInputState state,
    required Account account,
  }) : super(
          title: state.title,
          isDebt: state.isDebt,
          account: account,
        );
}

class Data extends AccountInputState {
  Data({
    required AccountInputState state,
    String? title,
    bool? isDebt,
  }) : super(
          title: title ?? state.title,
          isDebt: isDebt ?? state.isDebt,
          account: state.account,
        );

  Data.initial()
      : super(
          title: '',
          isDebt: false,
          account: null,
        );
}

class FetchAccount extends AccountInputState {
  FetchAccount({
    required Account account,
    required String title,
    required bool isDebt,
  }) : super(
    account: account,
    title: title,
    isDebt: isDebt,
  );

}

class AccountInputBloc
    extends Bloc<AccountInputEvent, AccountInputState> {
  final DataRepository _repository;

  AccountInputBloc(this._repository) : super(Data.initial()) {
    on<Fetch>(_fetch);
    on<ChangeTitle>(_changeTitle);
    on<ChangeIsDebt>(_changeIsDebt);
    on<Save>(_save);
  }

  Future<void> _fetch(Fetch event, Emitter<AccountInputState> emit) async {
    var account = await _repository.accounts.getById(event.accountId);
    var title = account.title;
    var isDebt = account.isDebt;

    emit(FetchAccount(
      account: account,
      title: title,
      isDebt: isDebt,
    ));
  }

  void _changeTitle(ChangeTitle event, Emitter<AccountInputState> emit) {
    emit(Data(state: state, title: event.title));
  }

  void _changeIsDebt(ChangeIsDebt event, Emitter<AccountInputState> emit) {
    emit(Data(isDebt: event.isDebt, state: state));
  }

  Future<void> _save(Save event, Emitter<AccountInputState> emit) async {
    if (state.account == null) {
      emit(SavedAccount(account: await _insertAccount(), state: state));
    } else {
      emit(SavedAccount(account: await _updateAccount(), state: state));
    }
  }

  Future<Account> _insertAccount() async {
    var account = Account(title: state.title, isDebt: state.isDebt);
    var id = await _repository.accounts.insert(account);

    return account.copyWith(id: id);
  }

  Future<Account> _updateAccount() async {
    var newAccount =
        state.account!.copyWith(title: state.title, isDebt: state.isDebt);
    await _repository.accounts.update(newAccount);

    return newAccount;
  }
}

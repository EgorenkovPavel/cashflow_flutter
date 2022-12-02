import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'account_input_bloc.freezed.dart';

@freezed
class AccountInputEvent with _$AccountInputEvent {
  const factory AccountInputEvent.fetch({required int accountId}) =
      _FetchAccountInputEvent;

  const factory AccountInputEvent.changeTitle({required String title}) =
      _ChangeTitleAccountInputEvent;

  const factory AccountInputEvent.changeIsDebt({required bool isDebt}) =
      _ChangeIsDebtAccountInputEvent;

  const factory AccountInputEvent.save() = _SaveAccountInputEvent;
}

@freezed
class AccountInputState with _$AccountInputState {
  const AccountInputState._();

  const factory AccountInputState.main({
    required String title,
    required bool isDebt,
    Account? account,
  }) = _MainAccountInputState;

  const factory AccountInputState.saved({
    required String title,
    required bool isDebt,
    required Account savedAccount,
  }) = _SavedAccountInputState;

  const factory AccountInputState.fetch({
    required String title,
    required bool isDebt,
    required Account fetchedAccount,
  }) = _FetchAccountInputState;

  bool get isSaved => maybeMap(
        saved: (_) => true,
        orElse: () => false,
      );

  bool get isFetched => maybeMap(
        fetch: (_) => true,
        orElse: () => false,
      );

  Account? get account => map(
    main: (state) => state.account,
    fetch: (state) => state.account,
    saved: (state) => state.account,
  );
}

class AccountInputBloc extends Bloc<AccountInputEvent, AccountInputState> {
  final DataRepository _repository;

  AccountInputBloc(this._repository)
      : super(const AccountInputState.main(
          title: '',
          isDebt: false,
          account: null,
        )) {
    on<AccountInputEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeTitle: (event) => _changeTitle(event, emitter),
          changeIsDebt: (event) => _changeIsDebt(event, emitter),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
      _FetchAccountInputEvent event, Emitter<AccountInputState> emit) async {
    var account = await _repository.accounts.getById(event.accountId);
    var title = account.title;
    var isDebt = account.isDebt;

    emit(AccountInputState.fetch(
      fetchedAccount: account,
      title: title,
      isDebt: isDebt,
    ));
  }

  void _changeTitle(
      _ChangeTitleAccountInputEvent event, Emitter<AccountInputState> emit) {
    emit(AccountInputState.main(
      title: event.title,
      isDebt: state.isDebt,
      account: state.account,
    ));
  }

  void _changeIsDebt(
      _ChangeIsDebtAccountInputEvent event, Emitter<AccountInputState> emit) {
    emit(AccountInputState.main(
      title: state.title,
      isDebt: event.isDebt,
      account: state.account,
    ));
  }

  Future<void> _save(
      _SaveAccountInputEvent event, Emitter<AccountInputState> emit) async {
    if (state.account == null) {
      emit(AccountInputState.saved(
        title: state.title,
        isDebt: state.isDebt,
        savedAccount: await _insertAccount(),
      ));
    } else {
      emit(AccountInputState.saved(
        title: state.title,
        isDebt: state.isDebt,
        savedAccount: await _updateAccount(),
      ));
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

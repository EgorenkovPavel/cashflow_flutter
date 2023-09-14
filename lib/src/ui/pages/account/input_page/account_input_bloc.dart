import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';

part 'account_input_bloc.freezed.dart';

@freezed
class AccountInputEvent with _$AccountInputEvent {
  const factory AccountInputEvent.fetch({
    required int accountId,
  }) = _FetchAccountInputEvent;

  const factory AccountInputEvent.changeTitle({
    required String title,
  }) = _ChangeTitleAccountInputEvent;

  const factory AccountInputEvent.changeIsDebt({
    required bool isDebt,
  }) = _ChangeIsDebtAccountInputEvent;

  const factory AccountInputEvent.changeCurrency({
    required Currency currency,
  }) = _ChangeCurrencyAccoutnInputEvent;

  const factory AccountInputEvent.save() = _SaveAccountInputEvent;
}

@freezed
class AccountInputState with _$AccountInputState {
  const factory AccountInputState({
    required String title,
    required bool isDebt,
    required Currency currency,
    Account? account,
    required bool isSaved,
  }) = _AccountInputState;
}

class AccountInputBloc extends Bloc<AccountInputEvent, AccountInputState> {
  final DataRepository _repository;

  AccountInputBloc(this._repository)
      : super(const AccountInputState(
          title: '',
          isDebt: false,
          currency: Currency.RUB,
          account: null,
          isSaved: false,
        )) {
    on<AccountInputEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeTitle: (event) => _changeTitle(event, emitter),
          changeIsDebt: (event) => _changeIsDebt(event, emitter),
          changeCurrency: (event) => _changeCurrency(event, emitter),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) async {
    final account = await _repository.accounts.getById(event.accountId);
    var title = account.title;
    var isDebt = account.isDebt;
    var currency = account.currency;

    emit(state.copyWith(
      account: account,
      title: title,
      isDebt: isDebt,
      currency: currency,
    ));
  }

  void _changeTitle(
    _ChangeTitleAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _changeIsDebt(
    _ChangeIsDebtAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) {
    emit(state.copyWith(isDebt: event.isDebt));
  }

  _changeCurrency(
    _ChangeCurrencyAccoutnInputEvent event,
    Emitter<AccountInputState> emit,
  ) {
    emit(state.copyWith(currency: event.currency));
  }

  Future<void> _save(
    _SaveAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) async {
    if (state.account == null) {
      emit(state.copyWith(
        account: await _insertAccount(),
        isSaved: true,
      ));
    } else {
      emit(state.copyWith(
        account: await _updateAccount(),
        isSaved: true,
      ));
    }
  }

  Future<Account> _insertAccount() async {
    var account = Account(
      title: state.title,
      isDebt: state.isDebt,
      currency: state.currency,
    );
    var id = await _repository.accounts.insert(account);

    return account.copyWith(id: id);
  }

  Future<Account> _updateAccount() async {
    var newAccount = state.account!.copyWith(
      title: state.title,
      isDebt: state.isDebt,
      currency: state.currency,
    );
    await _repository.accounts.update(newAccount);

    return newAccount;
  }
}

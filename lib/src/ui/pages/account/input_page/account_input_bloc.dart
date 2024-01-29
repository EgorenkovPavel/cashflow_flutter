import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';

import '../../../../domain/use_cases/get_account_by_id_use_case.dart';
import '../../../../domain/use_cases/insert_account_use_case.dart';
import '../../../../domain/use_cases/update_account_use_case.dart';

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

  static AccountInputState init() => const AccountInputState(
        title: '',
        isDebt: false,
        currency: Currency.RUB,
        account: null,
        isSaved: false,
      );

  static AccountInputState byAccount(Account account) => AccountInputState(
        account: account,
        title: account.title,
        isDebt: account.isDebt,
        currency: account.currency,
        isSaved: false,
      );
}

class AccountInputBloc extends Bloc<AccountInputEvent, AccountInputState> {
  final GetAccountByIdUseCase _getAccountByIdUseCase;
  final InsertAccountUseCase _insertAccountUseCase;
  final UpdateAccountUseCase _updateAccountUseCase;

  AccountInputBloc(
    this._getAccountByIdUseCase,
    this._insertAccountUseCase,
    this._updateAccountUseCase,
  ) : super(AccountInputState.init()) {
    on<AccountInputEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeTitle: (event) => emitter(state.copyWith(title: event.title)),
          changeIsDebt: (event) =>
              emitter(state.copyWith(isDebt: event.isDebt)),
          changeCurrency: (event) =>
              emitter(state.copyWith(currency: event.currency)),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) async {
    final account = await _getAccountByIdUseCase(accountId: event.accountId);

    emit(AccountInputState.byAccount(account));
  }

  Future<void> _save(
    _SaveAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) async {
    if (state.account == null) {
      emit(state.copyWith(
        account: await _insertAccountUseCase(
          title: state.title,
          isDebt: state.isDebt,
          currency: state.currency,
        ),
        isSaved: true,
      ));
    } else {
      emit(state.copyWith(
        account: await _updateAccountUseCase(
          account: state.account!,
          title: state.title,
          isDebt: state.isDebt,
          currency: state.currency,
        ),
        isSaved: true,
      ));
    }
  }
}

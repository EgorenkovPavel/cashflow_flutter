import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/account_interactor.dart';
import 'package:money_tracker/src/domain/interactors/user_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'account_input_bloc.freezed.dart';

@freezed
class AccountInputEvent with _$AccountInputEvent {
  const factory AccountInputEvent.fetch({required int accountId}) =
      _FetchAccountInputEvent;

  const factory AccountInputEvent.input({required bool isDebt}) =
      _InputAccountInputEvent;

  const factory AccountInputEvent.changeTitle(String title) =
      _ChangeTitleAccountInputEvent;

  const factory AccountInputEvent.changeUser(User? user) =
      _ChangeUserAccountInputEvent;

  const factory AccountInputEvent.save() = _SaveAccountInputEvent;
}

@freezed
class AccountInputState with _$AccountInputState {
  const factory AccountInputState({
    required String title,
    required bool isDebt,
    required int? userId,
    required List<User> users,
    BaseAccount? account,
    required bool isSaved,
  }) = _AccountInputState;

  static AccountInputState init() => const AccountInputState(
        title: '',
        isDebt: false,
        userId: null,
        users: [],
        account: null,
        isSaved: false,
      );

  static AccountInputState byAccount(BaseAccount account, List<User> users) =>
      AccountInputState(
        account: account,
        title: account.title,
        userId: account.userId,
        users: users,
        isDebt: account is Debt,
        isSaved: false,
      );
}

class AccountInputBloc extends Bloc<AccountInputEvent, AccountInputState> {
  final AccountInteractor _accountInteractor;
  final UserInteractor _userInteractor;

  AccountInputBloc(
    this._accountInteractor,
    this._userInteractor,
  ) : super(AccountInputState.init()) {
    on<AccountInputEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          input: (event) => _input(event, emitter),
          changeTitle: (event) => emitter(state.copyWith(title: event.title)),
          changeUser: (event) =>
              emitter(state.copyWith(userId: event.user?.id)),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) async {
    final account = await _accountInteractor.getById(event.accountId);
    final users = await _userInteractor.getAll();

    emit(AccountInputState.byAccount(account, users));
  }

  Future<void> _input(
    _InputAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) async {
    final users = await _userInteractor.getAll();
    emit(state.copyWith(isDebt: event.isDebt, users: users));
  }

  Future<void> _save(
    _SaveAccountInputEvent event,
    Emitter<AccountInputState> emit,
  ) async {
    if (state.account == null) {
      emit(state.copyWith(
        account: await _accountInteractor.insert(
          title: state.title,
          isDebt: state.isDebt,
          userId: state.userId,
        ),
        isSaved: true,
      ));
    } else {
      emit(state.copyWith(
        account: await _accountInteractor.update(
          account: state.account!,
          title: state.title,
          userId: state.userId,
        ),
        isSaved: true,
      ));
    }
  }
}

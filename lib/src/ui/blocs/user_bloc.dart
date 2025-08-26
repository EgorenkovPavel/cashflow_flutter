import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/user_interactor.dart';

import '../../domain/models.dart';

part 'user_bloc.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.changeUsers({
    required List<User> users,
  }) = _ChangeUsersUserEvent;
}

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState({
    required List<User> users,
  }) = _UserState;
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserInteractor _userInteractor;

  UserBloc(this._userInteractor) : super(const UserState(users: [])) {
    on<UserEvent>(
      (event, emit) => event.map(
        changeUsers: (event) => emit(UserState(users: event.users)),
      ),
    );

    _userInteractor
        .getAll()
        .then((users) => add(UserEvent.changeUsers(users: users)));
  }

}

extension UserBlocExt on BuildContext {

  List<User> watchUsers() =>
      watch<UserBloc>().state.users;

}
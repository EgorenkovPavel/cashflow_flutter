import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';

import '../../../../domain/view_models.dart';
import '../../../../utils/sum.dart';

part 'operation_edit_bloc.freezed.dart';

@freezed
class OperationEditEvent with _$OperationEditEvent {
  const factory OperationEditEvent.fetch({required int operationId}) =
      _FetchOperationEditEvent;

  const factory OperationEditEvent.changeDate({required DateTime date}) =
      _ChangeDateOperationEditEvent;

  const factory OperationEditEvent.changeTime({required TimeOfDay time}) =
      _ChangeTimeOperationEditEvent;

  const factory OperationEditEvent.changeOperationType(
      OperationType operationType) = _ChangeOperationTypeOperationEditEvent;

  const factory OperationEditEvent.changeAccount(AccountView account) =
      _ChangeAccountOperationEditEvent;

  const factory OperationEditEvent.changeCategory(CategoryView category) =
      _ChangeCategoryOperationEditEvent;

  const factory OperationEditEvent.changeRecAccount(
      AccountView recAccount) = _ChangeRecAccountOperationEditEvent;

  const factory OperationEditEvent.changeSum(int sum) =
      _ChangeSumOperationEditEvent;

  const factory OperationEditEvent.changeRecSum(int sum) =
      _ChangeRecSumOperationEditEvent;

  const factory OperationEditEvent.changeCurrency(Currency currency) =
      _ChangeCurrencyOperationEditEvent;

  const factory OperationEditEvent.changeRecCurrency(Currency currency) =
      _ChangeRecCurrencyOperationEditEvent;

  const factory OperationEditEvent.save() = _SaveOperationEditEvent;
}

@freezed
class OperationEditState with _$OperationEditState {
  const OperationEditState._();

  const factory OperationEditState({
    Operation? operation,
    required DateTime date,
    required TimeOfDay time,
    required OperationType operationType,
    int? accountId,
    int? categoryId,
    int? recAccountId,
    required Sum sum,
    required Sum recSum,
    required bool isSaved,
  }) = _OperationEditState;

  OperationEditState fromOperation(Operation operation) => switch (operation) {
        InputOperation() => copyWith(
            operation: operation,
            operationType: operation.type,
            date: operation.date,
            accountId: operation.account,
            categoryId: operation.analytic,
            sum: operation.sum,
            time: TimeOfDay.fromDateTime(operation.date),
          ),
        OutputOperation() => copyWith(
            operation: operation,
            operationType: operation.type,
            date: operation.date,
            accountId: operation.account,
            categoryId: operation.analytic,
            sum: operation.sum,
            time: TimeOfDay.fromDateTime(operation.date),
          ),
        TransferOperation() => copyWith(
            operation: operation,
            operationType: operation.type,
            date: operation.date,
            accountId: operation.account,
            recAccountId: operation.analytic,
            sum: operation.sum,
            recSum: operation.recSum,
            time: TimeOfDay.fromDateTime(operation.date),
          ),
      };
}

class OperationEditBloc extends Bloc<OperationEditEvent, OperationEditState> {
  final OperationInteractor _operationInteractor;

  OperationEditBloc(this._operationInteractor)
      : super(OperationEditState(
          date: DateTime.now(),
          time: TimeOfDay.now(),
          operationType: OperationType.INPUT,
          sum: Sum(0, Currency.RUB),
          recSum: Sum(0, Currency.RUB),
          isSaved: false,
        )) {
    on<OperationEditEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeDate: (event) => emitter(state.copyWith(date: event.date)),
          changeTime: (event) => emitter(state.copyWith(time: event.time)),
          changeOperationType: (event) => _changeOperationType(event, emitter),
          changeAccount: (event) =>
              emitter(state.copyWith(accountId: event.account.id)),
          changeCategory: (event) =>
              emitter(state.copyWith(categoryId: event.category.id)),
          changeRecAccount: (event) =>
              emitter(state.copyWith(recAccountId: event.recAccount.id)),
          changeSum: (event) =>
              emitter(state.copyWith(sum: state.sum.copyWith(sum: event.sum))),
          changeRecSum: (event) => emitter(
              state.copyWith(recSum: state.recSum.copyWith(sum: event.sum))),
          changeCurrency: (event) => emitter(state.copyWith(
              sum: state.sum.copyWith(currency: event.currency))),
          changeRecCurrency: (event) => emitter(state.copyWith(
              recSum: state.recSum.copyWith(currency: event.currency))),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) async {
    final operation = await _operationInteractor.getById(event.operationId);
    emit(state.fromOperation(operation));
  }

  void _changeOperationType(
    _ChangeOperationTypeOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(operationType: event.operationType, categoryId: null));
  }

  Future<void> _save(
    _SaveOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) async {
    if (state.operation == null) {
      emit(state.copyWith(
        operation: await _insertOperation(),
        isSaved: true,
      ));
    } else {
      emit(state.copyWith(
        operation: await _updateOperation(),
        isSaved: true,
      ));
    }
  }

  Future<Operation> _insertOperation() async {
    final date = DateTime(
      state.date.year,
      state.date.month,
      state.date.day,
      state.time.hour,
      state.time.minute,
    );

    return state.operationType.map(
      TRANSFER: () {
        return _operationInteractor.insertTransfer(
          date: date,
          accountId: state.accountId!,
          recAccountId: state.recAccountId!,
          sum: state.sum,
          recSum: state.recSum,
        );
      },
      INPUT: () {
        return _operationInteractor.insertInput(
          date: date,
          accountId: state.accountId!,
          categoryId: state.categoryId!,
          sum: state.sum,
        );
      },
      OUTPUT: () {
        return _operationInteractor.insertOutput(
          date: date,
          accountId: state.accountId!,
          categoryId: state.categoryId!,
          sum: state.sum,
        );
      },
    );
  }

  Future<Operation> _updateOperation() async {
    final date = DateTime(
      state.date.year,
      state.date.month,
      state.date.day,
      state.time.hour,
      state.time.minute,
    );

    return state.operationType.map(
      TRANSFER: () {
        return _operationInteractor.updateTransfer(
          operation: state.operation!,
          date: date,
          accountId: state.accountId!,
          recAccountId: state.recAccountId!,
          sum: state.sum,
          recSum: state.recSum,
        );
      },
      INPUT: () {
        return _operationInteractor.updateInput(
          operation: state.operation!,
          date: date,
          accountId: state.accountId!,
          categoryId: state.categoryId!,
          sum: state.sum,
        );
      },
      OUTPUT: () {
        return _operationInteractor.updateOutput(
          operation: state.operation!,
          date: date,
          accountId: state.accountId!,
          categoryId: state.categoryId!,
          sum: state.sum,
        );
      },
    );
  }
}

extension OperationEditBlocExt on BuildContext {
  OperationEditBloc _bloc() => read<OperationEditBloc>();

  OperationType operationType() => select<OperationEditBloc, OperationType>(
        (bloc) => bloc.state.operationType,
      );

  String date() => DateFormat.yMMMd(
        Localizations.localeOf(this).languageCode,
      ).format(select<OperationEditBloc, DateTime>(
        (bloc) => bloc.state.date,
      ));

  String time() => select<OperationEditBloc, TimeOfDay>(
        (bloc) => bloc.state.time,
      ).format(this);

  CategoryView? category(List<CategoryView> categories) {
    final categoryId = select<OperationEditBloc, int?>(
      (bloc) => bloc.state.categoryId,
    );
    return categories.where((e) => e.id == categoryId).firstOrNull;
  }

  AccountView? recAccount(List<AccountView> accounts) {
    final accountId = select<OperationEditBloc, int?>(
      (bloc) => bloc.state.recAccountId,
    );
    return accounts.where((e) => e.id == accountId).firstOrNull;
  }

  AccountView? account(List<AccountView> accounts) {
    final accountId = select<OperationEditBloc, int?>(
      (bloc) => bloc.state.accountId,
    );
    return accounts.where((e) => e.id == accountId).firstOrNull;
  }

  Currency currencySent() => select<OperationEditBloc, Currency>(
        (bloc) => bloc.state.sum.currency,
      );

  Currency currencyReceived() => select<OperationEditBloc, Currency>(
        (bloc) => bloc.state.recSum.currency,
      );

  String cloudId() => select<OperationEditBloc, String>(
        (bloc) => bloc.state.operation?.cloudId ?? '',
      );

  bool showRecSum() => select<OperationEditBloc, bool>((bloc) =>
      bloc.state.operationType == OperationType.TRANSFER &&
      bloc.state.accountId != null &&
      bloc.state.recAccountId != null);

  void onChangeOperationType(OperationType newValue) =>
      _bloc().add(OperationEditEvent.changeOperationType(newValue));

  void onChangeAccount(AccountView? newValue) {
    if (newValue != null) {
      _bloc().add(OperationEditEvent.changeAccount(newValue));
    }
  }

  void onChangeRecSum(String value) =>
      _bloc().add(OperationEditEvent.changeRecSum(int.parse(value)));

  void onChangeSum(String value) =>
      _bloc().add(OperationEditEvent.changeSum(int.parse(value)));

  void onChangeCurrency(Currency currency) =>
      _bloc().add(OperationEditEvent.changeCurrency(currency));

  void onChangeRecCurrency(Currency currency) =>
      _bloc().add(OperationEditEvent.changeRecCurrency(currency));

  void onRecAccountChange(AccountView? newValue) {
    if (newValue != null) {
      _bloc().add(OperationEditEvent.changeRecAccount(newValue));
    }
  }

  void onCategoryChange(CategoryView? newValue) {
    if (newValue != null) {
      _bloc().add(OperationEditEvent.changeCategory(newValue));
    }
  }

  void selectTime() async {
    final picked = await showTimePicker(
      context: this,
      initialTime: _bloc().state.time,
    );
    if (picked != null) {
      _bloc().add(OperationEditEvent.changeTime(time: picked));
    }
  }

  void selectDate() async {
    final picked = await showDatePicker(
      context: this,
      initialDate: _bloc().state.date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _bloc().add(OperationEditEvent.changeDate(date: picked));
    }
  }
}

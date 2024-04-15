import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'operation_filter_bloc.freezed.dart';

@freezed
class OperationFilterEvent with _$OperationFilterEvent {
  const factory OperationFilterEvent.init({
    required OperationListFilter filter,
  }) = _InitPeriodOperationFilterEvent;

  const factory OperationFilterEvent.resetPeriod() =
      _ResetPeriodOperationFilterEvent;

  const factory OperationFilterEvent.setPeriod({
    required DateTimeRange period,
  }) = _SetPeriodOperationFilterEvent;

  const factory OperationFilterEvent.addAccount({required Account account}) =
      _AddAccountOperationFilterEvent;

  const factory OperationFilterEvent.removeAccount({required Account account}) =
      _RemoveAccountOperationFilterEvent;

  const factory OperationFilterEvent.addCategory({required Category category}) =
      _AddCategoryOperationFilterEvent;

  const factory OperationFilterEvent.removeCategory({
    required Category category,
  }) = _RemoveCategoryOperationFilterEvent;
}

@freezed
class OperationFilterState with _$OperationFilterState {
  const OperationFilterState._();

  const factory OperationFilterState({
    DateTimeRange? period,
    @Default({}) Set<Account> accounts,
    @Default({}) Set<Category> categories,
  }) = _OperationFilterState;

  OperationListFilter get filter => OperationListFilter(
        period: period,
        accounts: accounts,
        categories: categories,
      );

  static byFilter(OperationListFilter cfilter) => OperationFilterState(
        period: cfilter.period,
        accounts: cfilter.accounts,
        categories: cfilter.categories,
      );

  OperationFilterState resetPeriod() => copyWith(period: null);

  OperationFilterState addAccount(Account account) => copyWith(
        accounts: accounts.toSet()..add(account),
      );

  OperationFilterState removeAccount(Account account) => copyWith(
        accounts: accounts.toSet()..removeWhere((a) => a.id == account.id),
      );

  OperationFilterState addCategory(Category category) => copyWith(
        categories: categories.toSet()..add(category),
      );

  OperationFilterState removeCategory(Category category) => copyWith(
        categories: categories.toSet()..removeWhere((c) => c.id == category.id),
      );

}

class OperationFilterBloc
    extends Bloc<OperationFilterEvent, OperationFilterState> {
  OperationFilterBloc() : super(const OperationFilterState()) {
    on<OperationFilterEvent>((event, emitter) => event.map(
          init: (event) => emitter(OperationFilterState.byFilter(event.filter)),
          resetPeriod: (event) => emitter(state.resetPeriod()),
          setPeriod: (event) => emitter(state.copyWith(period: event.period)),
          addAccount: (event) => emitter(state.addAccount(event.account)),
          removeAccount: (event) => emitter(state.removeAccount(event.account)),
          addCategory: (event) => emitter(state.addCategory(event.category)),
          removeCategory: (event) =>
              emitter(state.removeCategory(event.category)),
        ));
  }
}

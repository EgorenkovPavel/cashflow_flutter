import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';

import '../../../../domain/view_models.dart';

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

  const factory OperationFilterEvent.addAccount({required AccountView account}) =
      _AddAccountOperationFilterEvent;

  const factory OperationFilterEvent.removeAccount({required AccountView account}) =
      _RemoveAccountOperationFilterEvent;

  const factory OperationFilterEvent.addCategory({required CategoryView category}) =
      _AddCategoryOperationFilterEvent;

  const factory OperationFilterEvent.removeCategory({
    required CategoryView category,
  }) = _RemoveCategoryOperationFilterEvent;
}

@freezed
class OperationFilterState with _$OperationFilterState {
  const OperationFilterState._();

  const factory OperationFilterState({
    DateTimeRange? period,
    @Default({}) Set<int> accountIds,
    @Default({}) Set<int> categoryIds,
  }) = _OperationFilterState;

  OperationListFilter get filter => OperationListFilter(
        period: period,
        accountIds: accountIds,
        categoryIds: categoryIds,
      );

  static byFilter(OperationListFilter cfilter) => OperationFilterState(
        period: cfilter.period,
        accountIds: cfilter.accountIds,
        categoryIds: cfilter.categoryIds,
      );

  OperationFilterState resetPeriod() => copyWith(period: null);

  OperationFilterState addAccount(AccountView account) => copyWith(
        accountIds: accountIds.toSet()..add(account.id),
      );

  OperationFilterState removeAccount(AccountView account) => copyWith(
        accountIds: accountIds.toSet()..remove(account.id),
      );

  OperationFilterState addCategory(CategoryView category) => copyWith(
        categoryIds: categoryIds.toSet()..add(category.id),
      );

  OperationFilterState removeCategory(CategoryView category) => copyWith(
        categoryIds: categoryIds.toSet()..remove(category.id),
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

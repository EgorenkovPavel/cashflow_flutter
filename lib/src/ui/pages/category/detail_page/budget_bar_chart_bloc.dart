import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/category_interactor.dart';

import '../../../../utils/balance.dart';

part 'budget_bar_chart_bloc.freezed.dart';

@freezed
sealed class BudgetBarChartEvent with _$BudgetBarChartEvent {
  const factory BudgetBarChartEvent.fetch({
    required int categoryId,
    required int amount,
  }) = _FetchBudgetBarChartEvent;

  const factory BudgetBarChartEvent.change({
    required Map<DateTime, Balance> data,
  }) = _ChangeBudgetBarChartEvent;
}

@freezed
abstract class BudgetBarChartState with _$BudgetBarChartState {
  const factory BudgetBarChartState({required Map<DateTime, Balance> data}) =
      _BudgetBarChartState;
}

class BudgetBarChartBloc
    extends Bloc<BudgetBarChartEvent, BudgetBarChartState> {
  final CategoryInteractor _categoryInteractor;

  BudgetBarChartBloc(CategoryInteractor categoryInteractor)
    : _categoryInteractor = categoryInteractor,
      super(const BudgetBarChartState(data: {})) {
    on<BudgetBarChartEvent>(
      (event, emitter) => event.map(
        fetch: (event) => _fetch(event, emitter),
        change: (event) => emitter(BudgetBarChartState(data: event.data)),
      ),
    );
  }

  Future<void> _fetch(
    _FetchBudgetBarChartEvent event,
    Emitter<BudgetBarChartState> emit,
  ) async {
    final data = await _categoryInteractor.getMonthlyExpenses(
      event.categoryId,
      event.amount,
    );

    emit(BudgetBarChartState(data: data));
  }
}

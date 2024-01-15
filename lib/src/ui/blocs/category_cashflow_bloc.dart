import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../../domain/models.dart';
import '../../domain/models/enum/currency.dart';

part 'category_cashflow_bloc.freezed.dart';

@freezed
class CategoryCashflowEvent with _$CategoryCashflowEvent {
  const factory CategoryCashflowEvent.change({
    required List<CategoryCashflow> categories,
  }) = _ChangeCategoryCashflowEvent;
}

@freezed
class CategoryCashflowState with _$CategoryCashflowState {
  const factory CategoryCashflowState({
    required List<CategoryCashflow> categories,
    required Map<OperationType, Map<Currency, ({int cashflow, int budget})>>
        progress,
  }) = _CategoryCashflowState;
}

class CategoryCashflowBloc
    extends Bloc<CategoryCashflowEvent, CategoryCashflowState> {
  final DataRepository _dataRepository;
  StreamSubscription? _subCashflow;
  StreamSubscription? _sub;

  CategoryCashflowBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(CategoryCashflowState(
          categories: [],
          progress: {},
        )) {
    on<CategoryCashflowEvent>(
      (event, emit) => event.map(change: (event) => _onChange(event, emit)),
    );

    _sub = _dataRepository.categories.watchCashflow(DateTime.now()).listen((list) {
      add(CategoryCashflowEvent.change(
        categories: list
            // .map((e) => CategoryCashflow(
            //       category: e,
            //       monthCashflow: 0,
            //       yearCashflow: 0,
            //     ))
            // .toList(),
      ));
    });

    // _subCashflow =
    //     _dataRepository.categories.watchCashflow(DateTime.now()).listen((list) {
    //   add(CategoryCashflowEvent.change(categories: list));
    // });
  }

  @override
  Future<void> close() {
    _subCashflow?.cancel();
    _sub?.cancel();

    return super.close();
  }

  _onChange(
    _ChangeCategoryCashflowEvent event,
    Emitter<CategoryCashflowState> emit,
  ) {
    emit(state.copyWith(
      categories: event.categories,
      progress: _progress(event.categories),
    ));
  }

  Map<OperationType, Map<Currency, ({int cashflow, int budget})>> _progress(
      List<CategoryCashflow> items) {
    return Map.fromEntries(const [
      OperationType.INPUT,
      OperationType.OUTPUT,
    ].map((type) => MapEntry(
          type,
          Map.fromEntries(
            Currency.values.map((currency) => MapEntry(currency, (
                  cashflow: _cashflow(
                    items,
                    type,
                    currency,
                  ),
                  budget: _budget(
                    items,
                    type,
                    currency,
                  )
                ))),
          ),
        )));
  }

  int _cashflow(
    List<CategoryCashflow> items,
    OperationType operationType,
    Currency currency,
  ) {
    return items
        .where((item) =>
            item.category.operationType == operationType &&
            item.category.currency == currency)
        .map((item) => item.monthCashflow)
        .fold(
          0,
          (previousValue, element) => previousValue + element,
        );
  }

  int _budget(
    List<CategoryCashflow> items,
    OperationType operationType,
    Currency currency,
  ) {
    return items
            .where((item) =>
                item.category.budgetType == BudgetType.MONTH &&
                item.category.operationType == operationType &&
                item.category.currency == currency)
            .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + element.category.budget,
            ) +
        items
            .where((item) =>
                item.category.budgetType == BudgetType.YEAR &&
                item.category.operationType == operationType &&
                item.category.currency == currency)
            .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + (element.category.budget / 12).floor(),
            );
  }
}
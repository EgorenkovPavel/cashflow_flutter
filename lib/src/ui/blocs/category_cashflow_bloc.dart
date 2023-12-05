import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';

import '../../domain/models.dart';

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
  }) = _CategoryCashflowState;
}

class CategoryCashflowBloc
    extends Bloc<CategoryCashflowEvent, CategoryCashflowState> {
  final DataRepository _dataRepository;
  StreamSubscription? _subCashflow;
  StreamSubscription? _sub;

  CategoryCashflowBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(const CategoryCashflowState(categories: [])) {
    on<CategoryCashflowEvent>(
      (event, emit) => event.map(change: (event) => _onChange(event, emit)),
    );

    _sub = _dataRepository.categories.watchAll().listen((list) {
      add(CategoryCashflowEvent.change(
        categories: list
            .map((e) => CategoryCashflow(
                  category: e,
                  monthCashflow: 0,
                  yearCashflow: 0,
                ))
            .toList(),
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
    emit(state.copyWith(categories: event.categories));
  }
}

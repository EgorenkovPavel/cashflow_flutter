import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/category_interactor.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';

import '../../domain/models.dart';
import '../../domain/view_models.dart';

part 'category_cashflow_bloc.freezed.dart';

@freezed
class CategoryCashflowEvent with _$CategoryCashflowEvent {
  const factory CategoryCashflowEvent.change({
    required List<CategoryCashFlow> cashFlows,
  }) = _ChangeCategoryCashFlowEvent;

  const factory CategoryCashflowEvent.changeCategories({
    required List<Category> categories,
  }) = _ChangeCategoriesCategoryCashflowEvent;
}

@freezed
sealed class CategoryCashflowState with _$CategoryCashflowState {
  const CategoryCashflowState._();

  const factory CategoryCashflowState({
    required List<CategoryCashFlow> cashflows,
    required List<Category> categories,
  }) = _CategoryCashflowState;

  Iterable<CategoryItem> get items => categories.whereType<CategoryItem>();

  Iterable<CategoryGroup> get groups => categories.whereType<CategoryGroup>();

  List<CategoryItem> itemsByType(CategoryType type) =>
      items.where((e) => e.type == type).toList();

  List<CategoryGroup> groupsByType(CategoryType type) =>
      groups.where((e) => e.type == type).toList();

  List<Category> hierarchy(CategoryType type) =>
      _sort(groupsByType(type), itemsByType(type));

  List<Category> _sort(List<CategoryGroup> groups, List<CategoryItem> items) {
    final list = <Category>[];

    groups.forEach((group) {
      list.add(group);
      list.addAll(items.where((e) => e.parentId == group.id));
    });
    list.addAll(items.where((e) => e.parentId == null));

    return list;
  }
}

class CategoryCashflowBloc
    extends Bloc<CategoryCashflowEvent, CategoryCashflowState> {
  final CategoryInteractor _categoryInteractor;
  StreamSubscription? _subCashFlows;
  StreamSubscription? _subCategories;

  CategoryCashflowBloc(this._categoryInteractor)
    : super(const CategoryCashflowState(cashflows: [], categories: [])) {
    on<CategoryCashflowEvent>(
      (event, emit) => event.map(
        change: (event) => emit(state.copyWith(cashflows: event.cashFlows)),
        changeCategories: (event) =>
            emit(state.copyWith(categories: event.categories)),
      ),
    );

    _subCategories = _categoryInteractor.watchAll().listen((list) {
      add(CategoryCashflowEvent.changeCategories(categories: list));
    });

    _subCashFlows = _categoryInteractor.watchCashFlows().listen((list) {
      add(CategoryCashflowEvent.change(cashFlows: list));
    });
  }

  @override
  Future<void> close() {
    _subCashFlows?.cancel();
    _subCategories?.cancel();

    return super.close();
  }
}

extension CategoryCashFlowBlocExt on BuildContext {
  CategoryCashflowState _read() => read<CategoryCashflowBloc>().state;

  CategoryCashflowState _watch() => watch<CategoryCashflowBloc>().state;

  T _select<T>(T Function(CategoryCashflowState) selector) =>
      select<CategoryCashflowBloc, T>((bloc) => selector(bloc.state));

  List<Category> readHierarchy(CategoryType type) => _read().hierarchy(type);

  List<Category> watchHierarchy(CategoryType type) => _watch().hierarchy(type);

  int cashFlow(CategoryType type) {
    return _select((state) => state.cashflows)
        .where((e) => e.type == type)
        .map((item) => balanceToRub(item.monthCashFlow).sum)
        .fold(0, (a, b) => a + b);
  }

  int budget(CategoryType type) => _select((state) => state.categories)
      .whereType<CategoryItem>()
      .where((e) => e.type == type)
      .map((e) => e.monthBudget)
      .fold<int>(0, (a, b) => a + b);

  List<CategoryCashFlow> watchCashFlow(CategoryType type) =>
      _watch().cashflows.where((e) => e.type == type).toList();

  CategoryCashFlow watchCashflowById(int categoryId) =>
      _watch().cashflows.firstWhere((e) => e.categoryId == categoryId);

  int? getCategoryParentById(int id) =>
      _read().categories.where((e) => e.id == id).firstOrNull?.parentId;

  String getTitleById(int id) =>
      _read().categories.where((e) => e.id == id).firstOrNull?.title ?? '';

  List<CategoryCashFlow> watchTop(
    CategoryType categoryType,
    BudgetType budgetType,
    int count,
  ) {
    final list = watchCashFlow(
      categoryType,
    ).where((e) => balanceToRub(e.cashflowByType(budgetType)).sum != 0).toList();
    list.sort(
      (a, b) =>
          balanceToRub(b.cashflowByType(budgetType)).sum -
          balanceToRub(a.cashflowByType(budgetType)).sum,
    );
    return list.take(count).toList();
  }

  List<CategoryView> watchCategoryItems(CategoryType type) =>
      _select((state) => state.itemsByType(type).map(_mapToListItem).toList());

  List<CategoryView> watchCategoryItemsByParent(
    CategoryType type,
    int? parent,
  ) => _select(
    (state) => state
        .itemsByType(type)
        .where((e) => e.parentId == parent)
        .map(_mapToListItem)
        .toList(),
  );

  int watchGroupItemsAmount(int parentId) => _select(
    (state) => state.items.where((e) => e.parentId == parentId).length,
  );

  int watchItemsAmountNoParent(CategoryType type) => _select(
    (state) => state.itemsByType(type).where((e) => e.parentId == null).length,
  );

  List<CategoryView> watchCategoryGroups(CategoryType type) =>
      _select((state) => state.groupsByType(type).map(_mapToListItem).toList());

  List<CategoryView> readCategoryItems(CategoryType type) =>
      read<CategoryCashflowBloc>().state
          .itemsByType(type)
          .map(_mapToListItem)
          .toList();

  List<CategoryView> readCategoryGroups(CategoryType type) =>
      _read().groupsByType(type).map(_mapToListItem).toList();

  CategoryView _mapToListItem(Category category) =>
      CategoryView(id: category.id, title: category.title);
}

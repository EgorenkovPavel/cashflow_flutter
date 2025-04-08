import 'dart:async';

import 'package:flutter/cupertino.dart';
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
    required List<CategoryCashFlow> cashflows,
  }) = _ChangeCategoryCashflowEvent;

  const factory CategoryCashflowEvent.changeCategories({
    required List<Category> categories,
  }) = _ChangeCategoriesCategoryCashflowEvent;

  const factory CategoryCashflowEvent.changeCurrencyRate({
    required double usd,
    required double eur,
  }) = _ChangeCurrencyRateCategoryCashflowEvent;
}

@freezed
class CategoryCashflowState with _$CategoryCashflowState {
  const CategoryCashflowState._();

  const factory CategoryCashflowState({
    required List<CategoryCashFlow> cashflows,
    required List<Category> categories,
    required double usd,
    required double eur,
  }) = _CategoryCashflowState;

  List<InputCategoryItem> get inItems =>
      categories.whereType<InputCategoryItem>().toList();

  List<OutputCategoryItem> get outItems =>
      categories.whereType<OutputCategoryItem>().toList();

  List<InputCategoryGroup> get inGroups =>
      categories.whereType<InputCategoryGroup>().toList();

  List<OutputCategoryGroup> get outGroups =>
      categories.whereType<OutputCategoryGroup>().toList();

  int budget(CategoryType type) => switch (type) {
        CategoryType.INPUT => inputBudget(),
        CategoryType.OUTPUT => outputBudget(),
      };

  int cashFlow(CategoryType type) => switch (type) {
        CategoryType.INPUT => inputCashFlow(),
        CategoryType.OUTPUT => outputCashFlow(),
      };

  List<CategoryItem> items(CategoryType type) => switch (type) {
        CategoryType.INPUT => inItems,
        CategoryType.OUTPUT => outItems,
      };

  List<CategoryGroup> groups(CategoryType type) => switch (type) {
        CategoryType.INPUT => inGroups,
        CategoryType.OUTPUT => outGroups,
      };

  List<Category> hierarchy(CategoryType type) => switch (type) {
        CategoryType.INPUT => _sort(inGroups, inItems),
        CategoryType.OUTPUT => _sort(outGroups, outItems),
      };

  List<Category> _sort(List<CategoryGroup> groups, List<CategoryItem> items) {
    final list = <Category>[];

    groups.forEach((group) {
      list.add(group);
      list.addAll(items.where((e) => e.parentId == group.id));
    });
    list.addAll(items.where((e) => e.parentId == null));

    return list;
  }

  int inputCashFlow() => _cashFlow<InputCategoryCashFlow>();

  int outputCashFlow() => _cashFlow<OutputCategoryCashFlow>();

  int inputBudget() => _budget<InputCategoryItem>();

  int outputBudget() => _budget<OutputCategoryItem>();

  int _cashFlow<T extends CategoryCashFlow>() {
    return cashflows
        .whereType<T>()
        .map((item) => item.monthCashFlow.toRub(usd, eur))
        .fold(
          0,
          (previousValue, element) => previousValue + element,
        );
  }

  int _budget<T extends CategoryItem>() {
    return categories
            .whereType<T>()
            .where((item) => item.budgetType == BudgetType.MONTH)
            .fold<int>(
              0,
              (previousValue, element) => previousValue + element.budget,
            ) +
        categories
            .whereType<T>()
            .where((item) => item.budgetType == BudgetType.YEAR)
            .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + (element.budget / 12).floor(),
            );
  }
}

class CategoryCashflowBloc
    extends Bloc<CategoryCashflowEvent, CategoryCashflowState> {
  final CategoryInteractor _categoryInteractor;
  final CurrencyRateBloc _currencyRateBloc;
  StreamSubscription? _subCashFlows;
  StreamSubscription? _subCategories;
  StreamSubscription? _subCurrencyRateBloc;

  CategoryCashflowBloc(
    this._currencyRateBloc,
    this._categoryInteractor,
  ) : super(const CategoryCashflowState(
          cashflows: [],
          categories: [],
          usd: 1,
          eur: 1,
        )) {
    on<CategoryCashflowEvent>(
      (event, emit) => event.map(
        change: (event) => emit(state.copyWith(cashflows: event.cashflows)),
        changeCategories: (event) =>
            emit(state.copyWith(categories: event.categories)),
        changeCurrencyRate: (event) =>
            emit(state.copyWith(usd: event.usd, eur: event.eur)),
      ),
    );

    _subCategories = _categoryInteractor.watchAll().listen((list) {
      add(CategoryCashflowEvent.changeCategories(categories: list));
    });

    _subCashFlows = _categoryInteractor.watchCashFlows().listen((list) {
      add(CategoryCashflowEvent.change(cashflows: list));
    });

    _subCurrencyRateBloc = _currencyRateBloc.stream.listen((s) {
      add(CategoryCashflowEvent.changeCurrencyRate(usd: s.usd, eur: s.eur));
    });
  }

  @override
  Future<void> close() {
    _subCashFlows?.cancel();
    _subCategories?.cancel();
    _subCurrencyRateBloc?.cancel();

    return super.close();
  }
}

extension CategoryCashFlowBlocExt on BuildContext {
  List<Category> readHierarchy(CategoryType type) =>
      read<CategoryCashflowBloc>().state.hierarchy(type);

  int cashFlow(type) =>
      select<CategoryCashflowBloc, int>((bloc) => bloc.state.cashFlow(type));

  int budget(type) =>
      select<CategoryCashflowBloc, int>((bloc) => bloc.state.budget(type));

  List<CategoryView> watchInCategoryItems() =>
      select<CategoryCashflowBloc, List<CategoryView>>(
          (bloc) => bloc.state.inItems.map(_mapToListItem).toList());

  List<CategoryView> watchOutCategoryItems() =>
      select<CategoryCashflowBloc, List<CategoryView>>(
          (bloc) => bloc.state.outItems.map(_mapToListItem).toList());

  List<CategoryView> watchCategoryItems(CategoryType type, int? parent) =>
      select<CategoryCashflowBloc, List<CategoryView>>((bloc) => bloc.state
          .items(type)
          .where((e) => e.parentId == parent)
          .map(_mapToListItem)
          .toList());

  int watchGroupItemsAmount(int parentId) =>
      select<CategoryCashflowBloc, int>((bloc) => bloc.state.categories
          .whereType<CategoryItem>()
          .where((e) => e.parentId == parentId)
          .length);

  int watchItemsAmountNoParent(CategoryType type) =>
      select<CategoryCashflowBloc, int>((bloc) =>
          bloc.state.items(type).where((e) => e.parentId == null).length);

  List<CategoryView> watchCategoryGroups(CategoryType type) =>
      select<CategoryCashflowBloc, List<CategoryView>>(
          (bloc) => bloc.state.groups(type).map(_mapToListItem).toList());

  List<CategoryView> readInCategoryItems() =>
      read<CategoryCashflowBloc>().state.inItems.map(_mapToListItem).toList();

  List<CategoryView> readOutCategoryItems() =>
      read<CategoryCashflowBloc>().state.outItems.map(_mapToListItem).toList();

  List<CategoryView> readCategoryGroups(CategoryType type) =>
      read<CategoryCashflowBloc>()
          .state
          .groups(type)
          .map(_mapToListItem)
          .toList();

  CategoryView _mapToListItem(Category category) => switch (category) {
        InputCategoryItem() =>
          CategoryView(id: category.id, title: category.title),
        OutputCategoryItem() =>
          CategoryView(id: category.id, title: category.title),
        InputCategoryGroup() =>
          CategoryView(id: category.id, title: category.title),
        OutputCategoryGroup() =>
          CategoryView(id: category.id, title: category.title),
      };
}

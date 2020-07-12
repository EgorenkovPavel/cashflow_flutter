import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_category.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/category_page.dart';
import 'package:flutter/material.dart';

class CategoryList extends MainList<CategoryCashflowBudget> {
  CategoryList(Stream<List<CategoryCashflowBudget>> stream) : super(stream);

  @override
  Widget listBuilder(BuildContext context, List<CategoryCashflowBudget> categories) {
    return ListView.separated(
      itemCount: categories.length,
      itemBuilder: (_, index) {
        final itemCategory = categories[index];
        return ListTileCategory(
          category: itemCategory,
          onTap: () => onItemTap(context, itemCategory),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }

  @override
  void onItemTap(BuildContext context, CategoryCashflowBudget item) {
    CategoryPage.open(context, item.id);
  }

  @override
  Widget emptyListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListCategories,
      hint: AppLocalizations.of(context).hintEmptyList,
    );
  }
}

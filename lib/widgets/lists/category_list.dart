import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/widgets/cashflow_category_chart.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/item_cards/category_card.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_category.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/category_page.dart';
import 'package:flutter/material.dart';

class CategoryList extends MainList<CategoryCashflowBudget> {
  CategoryList(Stream<List<CategoryCashflowBudget>> stream) : super(stream);

  @override
  Widget listBuilder(BuildContext context, List<CategoryCashflowBudget> categories) {
    return ListView.separated(
      itemCount: categories.length + 1,
      itemBuilder: (_, index) {
        if(index == 0){
          return SizedBox(
            child: CashflowCategoryChart(categories: categories),
            height: 400.0,
          );
        }
        final itemCategory = categories[index -1];
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
  Widget emptyListHint() {
    return EmptyListHint(
      title: 'List of categories is empty',
      hint: 'Press button to add first one',
    );
  }
}

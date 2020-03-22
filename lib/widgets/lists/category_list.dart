import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/widgets/cards/category_card.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_category.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/category_page.dart';
import 'package:flutter/material.dart';

class CategoryList extends MainList<Category> {
  CategoryList(Stream<List<Category>> stream) : super(stream);

  @override
  Widget listBuilder(BuildContext context, List<Category> categories) {
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

  static void addItem(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: CategoryCard(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  @override
  void onItemTap(BuildContext context, Category item) {
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

import 'package:cashflow/cards/category_card.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/pages/category_page.dart';
import 'package:cashflow/pages/main_list.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/repository.dart';

class CategoryList extends StatelessWidget implements MainList<CategoryData>{

  Widget categoryList(BuildContext context, List<CategoryData> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (_, index) {
        final itemCategory = categories[index];
        return Column(
            children: <Widget>[
              ListTile(
                title: Text(itemCategory.title),
                subtitle: Text(
                  getOperationTitle(context, itemCategory.operationType),
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: getOperationColor(itemCategory.operationType)),
                ),
                onTap: () => onItemTap(context, itemCategory),
              ),
              Divider()
            ],
          );
      },
    );
  }

  @override
  void addItem(BuildContext context) {
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
  void filterList() {
    // TODO: implement filterList
  }

  @override
  void onItemTap(BuildContext context, CategoryData item) {
    CategoryPage.open(context, item.id);
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Repository>(context);
    return StreamBuilder<List<CategoryData>>(
      stream: model.watchAllCategories(),
      builder: (context, AsyncSnapshot<List<CategoryData>> snapshot) {

        if (!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.data.isEmpty) {
          return EmptyListHint(AppLocalizations.of(context).hintEmptyListCategories);
        }

        final categories = snapshot.data ?? List();

        return categoryList(context, categories);
      },
    );
  }
}

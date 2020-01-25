import 'package:cashflow/cards/category_card.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/pages/main_list.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class CategoryList extends StatelessWidget implements MainList<CategoryData>{

  Widget categoryList(BuildContext context, List<CategoryData> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (_, index) {
        final itemCategory = categories[index];
        return Dismissible(
          key: Key(itemCategory.id.toString()),
          child: Column(
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
          ),
          secondaryBackground:
          dismissBackground(context, Alignment.centerRight),
          background: dismissBackground(context, Alignment.centerLeft),
          onDismissed: (_) async {
            await Provider.of<Model>(context, listen: false)
                .updateCategory(itemCategory.copyWith(archive: true));

            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context).mesCategoryArchived)));
          },
        );
      },
    );
  }

  Container dismissBackground(BuildContext context, Alignment alignment) {
    return Container(
      color: Colors.grey,
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.archive, color: Colors.white,),
            Text(
              AppLocalizations.of(context).archive.toUpperCase(),
              style:
              Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
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
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: CategoryCard(
                category: item,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
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

import 'package:cashflow/cards/category_card.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class CategoryList extends StatelessWidget {
  void onTap(BuildContext context, CategoryData itemCategory) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: CategoryCard(
                category: itemCategory,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

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
                getOperationTitle(itemCategory.operationType),
                style: Theme.of(context).textTheme.caption.copyWith(
                    color: getOperationColor(itemCategory.operationType)),
              ),
              onTap: () => onTap(context, itemCategory),
            ),
            Divider()
          ],
        );
      },
    );
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
          return EmptyListHint('Add category');
        }

        final categories = snapshot.data ?? List();

        return categoryList(context, categories);
      },
    );
  }
}

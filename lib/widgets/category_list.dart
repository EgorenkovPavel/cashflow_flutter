import 'package:cashflow/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return StreamBuilder<List<CategoryData>>(
      stream: model.watchAllCategories(),
      builder: (context, AsyncSnapshot<List<CategoryData>> snapshot) {
        final categories = snapshot.data ?? List();

        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (_, index) {
            final itemCategory = categories[index];
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(itemCategory.title),
                  onTap: () {
                    Navigator.pushNamed(context, CategoryPage.routeName,
                        arguments: itemCategory);
                  },
                ),
                Divider()
              ],
            );
          },
        );
      },
    );
  }
}

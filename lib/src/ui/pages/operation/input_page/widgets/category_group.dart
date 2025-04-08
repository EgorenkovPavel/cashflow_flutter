import 'package:flutter/material.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';

import '../../../../../domain/view_models.dart';

class CategoryListGroup extends StatelessWidget {
  const CategoryListGroup({
    super.key,
    required this.category,
    required this.type,
  });

  final CategoryView category;
  final CategoryType type;

  @override
  Widget build(BuildContext context) {
    final title = category.title;

    final itemsAmount = category == CategoryView.groupNoParent()
        ? context.watchItemsAmountNoParent(type)
        : context.watchGroupItemsAmount(category.id);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            decoration: BoxDecoration(
              //border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Theme.of(context).primaryColor.withAlpha(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            child: Text(
              '$itemsAmount items', //TODO
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          )
        ]);
  }
}

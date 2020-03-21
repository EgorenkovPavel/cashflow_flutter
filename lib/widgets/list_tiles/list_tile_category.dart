import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class ListTileCategory extends StatelessWidget{

  final Category category;
  final GestureTapCallback onTap;

  const ListTileCategory({Key key, this.category, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.title),
      subtitle: Text(
        getOperationTitle(context, category.type),
        style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(color: getOperationColor(category.type)),
      ),
      onTap: () => onTap,
    );
  }

}
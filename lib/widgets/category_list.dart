import 'package:cashflow/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model.dart';

class CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox();
//    return Consumer<Model>(builder: (context, model, child){
//      return ListView.builder(
//        itemBuilder: (BuildContext context, int pos) {
//          return Column(
//            children: <Widget>[
//              ListTile(
//                title: Text(model.categories[pos].title),
//                onTap: (){
//                  Navigator.pushNamed(context, CategoryPage.routeName, arguments: model.categories[pos]);
//                },
//              ),
//              Divider()
//            ],
//          );
//        },
//        itemCount: model.categories.length,
//      );
//    },);
  }
}

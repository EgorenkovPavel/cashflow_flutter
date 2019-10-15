import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../model.dart';

class CategoryPage extends StatefulWidget {

  static const routeName = '/category';

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  OperationType _type;

  final TextEditingController controller = TextEditingController();

  CategoryData category = null;

  void _onTypeChanged(OperationType type){
    setState(() {
      _type = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context).settings.arguments;
    controller.text = category == null ? '' : category.title;
    _type = category == null ? OperationType.INPUT : category.operationType;

    return Scaffold(
      appBar: AppBar(title: Text('Category'),
      actions: <Widget>[
        FlatButton(child: Text('Save'),
          onPressed: (){
            if(category == null){
              category = CategoryData(title: controller.text, operationType: _type);
              Provider.of<Model>(context, listen: false).insertCategory(category);
            }else{
              category = category.copyWith(title: controller.text, operationType: _type);
              Provider.of<Model>(context, listen: false).updateCategory(category);
            }

            Navigator.pop(context);
          },)
      ],),

      body: Column(
        children: <Widget>[
          TextField(controller: controller),
          Row(
            children: <Widget>[
              Radio(value: OperationType.INPUT, groupValue: _type, onChanged: _onTypeChanged,),
              Text('Input'),
              Radio(value: OperationType.OUTPUT, groupValue: _type, onChanged: _onTypeChanged,),
              Text('Output'),
            ],
          )
        ],
      ),
    );
  }

}

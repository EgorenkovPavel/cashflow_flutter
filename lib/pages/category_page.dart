import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {

  static const routeName = '/category';

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  OperationType _type;

  void _onTypeChanged(OperationType type){
    setState(() {
      _type = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category'),),
      body: Column(
        children: <Widget>[
          TextField(),
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

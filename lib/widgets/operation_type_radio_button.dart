
import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class OperationTypeRadioButton extends StatelessWidget{

  final Function onChange;
  final OperationType type;
  final List<OperationType> items;

  const OperationTypeRadioButton({Key key, this.onChange, this.type, this.items}) : super(key: key);

  Widget RadioButton(OperationType _type, String title){
    return RaisedButton(
      child: Text(title),
      color: type == _type ? Colors.deepOrangeAccent : Colors.black26,
      onPressed: (){
        onChange(_type);
      },
    );
  }

  String getTitle(OperationType _type){
    switch(_type){
      case OperationType.INPUT: return 'INPUT';
      case OperationType.OUTPUT: return 'OUTPUT';
      case OperationType.TRANSFER: return 'TRANSFER';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((item) => RadioButton(item, getTitle(item))).toList(),
//      children: <Widget>[
//        RadioButton(OperationType.INPUT, 'INPUT'),
//        RadioButton(OperationType.OUTPUT, 'OUTPUT'),
//        RadioButton(OperationType.TRANSFER, 'TRANSFER'),
//      ],
    );
  }
}
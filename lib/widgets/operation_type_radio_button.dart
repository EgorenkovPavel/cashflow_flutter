
import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class OperationTypeRadioButton extends StatelessWidget{

  final Function onChange;
  final OperationType type;
  final List<OperationType> items;

  const OperationTypeRadioButton({Key key, this.onChange, this.type, this.items}) : super(key: key);

  Widget RadioButton(BuildContext context, OperationType _type, String title){
    final color = type == _type ? Theme.of(context).primaryColor : Colors.transparent;
    final textColor = type == _type ? Colors.white : Colors.black;

    return FlatButton(
      child: Text(title),
      color: color,
      //shape: Border.all(color: color),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textColor: textColor,

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

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) => RadioButton(context, item, getTitle(item))).toList(),
      ),
    );
  }
}
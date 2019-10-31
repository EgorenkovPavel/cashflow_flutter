
import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class OperationTypeRadioButton extends StatelessWidget{

  final Function onChange;
  final OperationType type;

  const OperationTypeRadioButton({Key key, this.onChange, this.type}) : super(key: key);

  Widget RadioButton(OperationType _type, String title){
    return RaisedButton(
      child: Text(title),
      color: type == _type ? Colors.deepOrangeAccent : Colors.black26,
      onPressed: (){
        onChange(_type);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RadioButton(OperationType.INPUT, 'INPUT'),
        RadioButton(OperationType.OUTPUT, 'OUTPUT'),
        RadioButton(OperationType.TRANSFER, 'TRANSFER'),
      ],
    );
  }
}
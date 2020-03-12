import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class OperationTypeRadioButton extends StatelessWidget{
  final Function onChange;
  final OperationType type;

  final List<OperationType> items;

  const OperationTypeRadioButton(
      {Key key, this.onChange, this.type, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map((item) => Flexible(
                child: ClipRRect(
                  borderRadius: getBorderRadius(item),
                  child: RawMaterialButton(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getOperationTitle(context, item).toUpperCase(),
                      style: TextStyle(
                          color: item == type ? Colors.white : Colors.black),
                    ),
                    fillColor: item == type ? Theme.of(context).primaryColor : Colors.white,
                    onPressed: (){onChange(item);},
                  ),
                ),
                flex: 1,
                fit: FlexFit.tight,
              ))
          .toList(),
    );
  }

  BorderRadiusGeometry getBorderRadius(item){
    int index = items.indexOf(item);
    if(index == 0){
      return BorderRadius.horizontal(left: Radius.circular(14.0));
    }else if (index == items.length-1){
      return BorderRadius.horizontal(right: Radius.circular(14.0));
    } else{
      return BorderRadius.all(Radius.circular(0.0));
    }
  }
}

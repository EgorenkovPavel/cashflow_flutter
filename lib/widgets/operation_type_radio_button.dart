import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class OperationTypeRadioButton extends StatelessWidget {
  final Function onChange;
  final OperationType type;

  final List<OperationType> items;

  const OperationTypeRadioButton(
      {Key key, this.onChange, this.type, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Row(
          children: items
              .map((item) => Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: RawMaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      elevation: 0.0,
                      fillColor: item == type
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      onPressed: () {
                        onChange(item);
                      },
                      child: Text(
                        getOperationTitle(context, item).toUpperCase(),
                        style: TextStyle(
                            color: item == type ? Colors.white : Colors.black),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  BorderRadiusGeometry getBorderRadius(item) {
    var index = items.indexOf(item);
    if (index == 0) {
      return BorderRadius.horizontal(left: Radius.circular(14.0));
    } else if (index == items.length - 1) {
      return BorderRadius.horizontal(right: Radius.circular(14.0));
    } else {
      return BorderRadius.all(Radius.circular(0.0));
    }
  }
}

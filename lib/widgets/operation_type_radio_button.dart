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
    return ToggleButtons(
      children: items
          .map((item) => Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  getOperationTitle(context, item).toUpperCase(),
                  style: TextStyle(
                      color: item == type ? Colors.white : Colors.black),
                ),
              ))
          .toList(),
      borderColor: Theme.of(context).primaryColor,
      borderWidth: 2.0,
      selectedBorderColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      fillColor: Theme.of(context).primaryColor,
      isSelected: items.map((item) => item == type).toList(),
      onPressed: (index) {
        onChange(items[index]);
      },
    );
  }
}

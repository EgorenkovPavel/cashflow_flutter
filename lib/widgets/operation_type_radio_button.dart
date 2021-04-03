import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';

class OperationTypeRadioButton extends StatelessWidget {
  final void Function(OperationType) onChange;
  final OperationType type;

  final List<OperationType> items;

  const OperationTypeRadioButton(
      {Key key, this.onChange, this.type, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: items.map((e) => e == type).toList(),
      onPressed: (index) => onChange(items[index]),
      borderRadius: BorderRadius.all(Radius.circular(14.0)),
      children: items
          .map(
            (e) => Container(
              padding: EdgeInsets.all(16),
              child: Text(
                getOperationTitle(context, e).toUpperCase(),
              ),
            ),
          )
          .toList(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models/operation_type.dart';

class OperationTypeRadioButton extends StatelessWidget {
  final void Function(OperationType) onChange;
  final OperationType type;

  final List<OperationType> items;

  const OperationTypeRadioButton(
      {Key? key, required this.onChange, required this.type, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: items.map((e) => e == type).toList(),
      onPressed: (index) => onChange(items[index]),
      borderRadius: const BorderRadius.all(Radius.circular(14.0)),
      borderColor: Theme.of(context).primaryColor,
      selectedColor: Colors.white,
      fillColor: Theme.of(context).primaryColor,
      children: items
          .map(
            (e) => _OperationTypeItem(
              type: e,
            ),
          )
          .toList(),
    );
  }
}

class _OperationTypeItem extends StatelessWidget {
  const _OperationTypeItem({
    Key? key,
    type,
  })  : _type = type,
        super(key: key);

  final OperationType _type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        getOperationTitle(context, _type).toUpperCase(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class TypeRadioButton<T> extends StatelessWidget {
  final void Function(T) onChange;
  final T type;

  final List<T> items;

  const TypeRadioButton({
    Key? key,
    required this.onChange,
    required this.type,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: items.map((e) => e == type).toList(),
      onPressed: (index) => onChange(items[index]),
      borderRadius: const BorderRadius.all(Radius.circular(14.0)),
      borderColor: Theme.of(context).colorScheme.primary,
      selectedColor: Colors.white,
      fillColor: Theme.of(context).colorScheme.primary,
      children: items
          .map(
            (e) => _TypeItem<T>(
              type: e,
            ),
          )
          .toList(),
    );
  }
}

class _TypeItem<T> extends StatelessWidget {
  const _TypeItem({
    Key? key,
    type,
  })  : _type = type,
        super(key: key);

  final T _type;

  String getTitle(BuildContext context) {
    if (_type is OperationType) {
      return context.loc.operationTypeTitle(_type as OperationType);
    } else if (_type is BudgetType) {
      return context.loc.budgetTypeTitle(_type as BudgetType);
    } else {
      return _type.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        getTitle(context).toUpperCase(),
      ),
    );
  }
}

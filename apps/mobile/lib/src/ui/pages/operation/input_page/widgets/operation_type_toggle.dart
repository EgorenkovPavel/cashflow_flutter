import 'package:flutter/material.dart';

import '../../../../../domain/models.dart';
import '../../../../../utils/extensions.dart';

class OperationTypeToggle extends StatelessWidget {
  final OperationType type;
  final Function(OperationType) onChange;

  const OperationTypeToggle({
    super.key,
    required this.type,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleButtons(
          constraints: BoxConstraints.expand(
            width: constraints.maxWidth / 4 - 4, // делим на количество кнопок
          ),
          isSelected: OperationType.values.map((e) => e == type).toList(),
          borderRadius: const .all(.circular(14.0)),
          borderColor: Theme.of(context).colorScheme.primary,
          selectedColor: Colors.white,
          fillColor: Theme.of(context).colorScheme.primary,
          onPressed: (index) => onChange(OperationType.values[index]),
          children: OperationType.values.map((e) => Icon(e.icon)).toList(),
        );
      },
    );
  }
}

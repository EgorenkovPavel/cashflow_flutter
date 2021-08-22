
import 'package:flutter/material.dart';
import 'package:money_tracker/utils/app_localization.dart';

enum OperationType { INPUT, OUTPUT, TRANSFER }

Color getOperationColor(OperationType type) {
  switch (type) {
    case OperationType.INPUT:
      return Colors.green;

    case OperationType.OUTPUT:
      return Colors.red;

    case OperationType.TRANSFER:
      return Colors.blue;

    default:
      return Colors.transparent;
  }
}

IconData getOperationIcon(OperationType type) {
  switch (type) {
    case OperationType.INPUT:
      return Icons.add;

    case OperationType.OUTPUT:
      return Icons.remove;

    case OperationType.TRANSFER:
      return Icons.redo;

    default:
      return Icons.do_not_disturb_on;
  }
}

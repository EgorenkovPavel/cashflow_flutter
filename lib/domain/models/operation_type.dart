
import 'package:flutter/material.dart';

enum OperationType { INPUT, OUTPUT, TRANSFER }

extension Theming on OperationType{
  Color color() {
    switch (this) {
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

  IconData icon() {
    switch (this) {
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
}





import 'package:flutter/material.dart';

enum OperationType{
  INPUT, OUTPUT, TRANSFER
}

Color getOperationColor(OperationType type) {
  switch (type) {
    case OperationType.INPUT:
      return Colors.green;

    case OperationType.OUTPUT:
      return Colors.red;

    case OperationType.TRANSFER:
      return Colors.blue;
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
  }
}

String getOperationTitle(OperationType _type) {
  switch (_type) {
    case OperationType.INPUT:
      return 'Input';
    case OperationType.OUTPUT:
      return 'Output';
    case OperationType.TRANSFER:
      return 'Transfer';
  }
}
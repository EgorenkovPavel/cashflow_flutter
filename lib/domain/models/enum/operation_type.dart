// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum OperationType {
  INPUT(Colors.green, Icons.add),
  OUTPUT(Colors.red, Icons.remove),
  TRANSFER(Colors.blue, Icons.redo);

  final Color color;
  final IconData icon;

  const OperationType(this.color, this.icon);

  T map<T>({
    required T Function() INPUT,
    required T Function() OUTPUT,
    required T Function() TRANSFER,
  }) {
    switch (this) {
      case OperationType.INPUT:
        return INPUT();
      case OperationType.OUTPUT:
        return OUTPUT();
      case OperationType.TRANSFER:
        return TRANSFER();
    }
  }
}

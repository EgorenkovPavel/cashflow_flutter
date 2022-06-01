// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum OperationType {
  INPUT(Colors.green, Icons.add),
  OUTPUT(Colors.red, Icons.remove),
  TRANSFER(Colors.blue, Icons.redo);

  final Color color;
  final IconData icon;

  const OperationType(this.color, this.icon);
}

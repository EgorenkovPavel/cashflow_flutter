import 'package:flutter/material.dart';

class Dimensions {
  static const double padding = 14.0;
}

const Color _primaryColor = Color(0xFF236F57);

ThemeData theme() => ThemeData(
      primaryColor: _primaryColor,
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    actionsIconTheme: IconThemeData(
      color: Colors.white
    ),
  ),
    );

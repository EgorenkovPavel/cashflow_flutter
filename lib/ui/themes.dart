import 'package:flutter/material.dart';

class Dimensions {
  static const double padding = 14.0;
}

const Color _primaryColor = Color(0xFF236F57);
const Color _accentColor = Color(0xFFF15931);

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: _primaryColor,
      secondary: _accentColor,
    ),
    appBarTheme: AppBarTheme(
      //brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_primaryColor))),
  );
}

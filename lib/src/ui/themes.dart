import 'package:flutter/material.dart';

class Dimensions {
  static const double padding = 14.0;
}

const Color _primaryColor = Color(0xFF236F57);
const Color _accentColor = Color(0xFFF15931);

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
      //brightness: _accentColor,
    ),
    appBarTheme: const AppBarTheme(
      //brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(_primaryColor),
    //     textStyle: WidgetStateTextStyle.resolveWith((states) => const TextStyle().copyWith(color: Colors.white)),
    //   ),
    // ),
  );
}

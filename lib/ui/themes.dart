import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.grey[900],
  primarySwatch: Colors.grey,
  accentColor: Colors.deepOrangeAccent,
  primaryTextTheme: TextTheme(),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      backgroundColor: Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
//brightness: Brightness.light,
  ),
);

ThemeData darkTheme() => ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  primarySwatch: Colors.grey,
  accentColor: Colors.deepOrangeAccent,
);

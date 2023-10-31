import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.white,
      secondary: Colors.grey[800]!,
    ));

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
  background: Colors.white,
  primary: Colors.black,
  secondary: Colors.grey[800]!,
));

import 'package:flutter/material.dart';

ThemeData customTheme() {
  return createCustomTheme(Colors.blue);
}

ThemeData createCustomTheme(Color primaryColor) {
  return ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.blue[50],
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: primaryColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

// main.dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _currentTheme = customTheme();

  void updateTheme(ThemeData theme) {
    setState(() {
      _currentTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ColorNote',
      theme: _currentTheme,
      home: HomePage(onThemeChanged: updateTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}

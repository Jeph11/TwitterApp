import 'package:flutter/material.dart';
import 'package:twitter_clone/first_page.dart';
import 'package:twitter_clone/theme/theme_constant.dart';
import 'package:twitter_clone/theme/theme_manager.dart';

void main() {
  runApp(const TwitterApp());
}

ThemeManager _themeManager = ThemeManager();

class TwitterApp extends StatefulWidget {
  const TwitterApp({super.key});

  @override
  State<TwitterApp> createState() => _TwitterAppState();
}

class _TwitterAppState extends State<TwitterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const FirstPage(),
    );
  }
}

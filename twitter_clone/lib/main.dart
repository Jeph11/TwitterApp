import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/dark_theme.dart';
import 'package:twitter_clone/theme/ligth_theme.dart';

import 'home_page.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}

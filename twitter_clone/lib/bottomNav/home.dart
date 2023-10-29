import 'package:flutter/material.dart';

class HomeIcon extends StatefulWidget {
  const HomeIcon({super.key});

  @override
  State<HomeIcon> createState() => _HomeIconState();
}

class _HomeIconState extends State<HomeIcon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              children: [
                Text(
                  '@ojephthans',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            )));
  }
}

import 'package:flutter/material.dart';

class SearchIcon extends StatefulWidget {
  const SearchIcon({super.key});

  @override
  State<SearchIcon> createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
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

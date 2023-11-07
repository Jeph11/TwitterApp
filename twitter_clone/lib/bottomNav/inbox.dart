import 'package:flutter/material.dart';

class InboxIcon extends StatelessWidget {
  const InboxIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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

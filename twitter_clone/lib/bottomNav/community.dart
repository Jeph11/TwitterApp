import 'package:flutter/material.dart';

class CommunityIcon extends StatelessWidget {
  const CommunityIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Text(
          '@ojepht',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    )));
  }
}

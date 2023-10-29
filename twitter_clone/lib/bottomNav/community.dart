import 'package:flutter/material.dart';

class CommunityIcon extends StatelessWidget {
  const CommunityIcon({super.key});

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

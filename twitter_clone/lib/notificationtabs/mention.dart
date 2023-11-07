import 'package:flutter/material.dart';

class MentionPage extends StatefulWidget {
  const MentionPage({Key? key}) : super(key: key);

  @override
  State<MentionPage> createState() => _MentionPageState();
}

class _MentionPageState extends State<MentionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Positioned(
          bottom: 250,
          left: 60,
          right: 60,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/images/green.png',
            ),
          ),
        ),
        Positioned(
          bottom: 230,
          left: 60,
          right: 60,
          child: SizedBox(
            width: 160,
            height: 160,
            child: Image.asset(
              'assets/images/cartoon_bread.png',
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 30,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Join the conversation',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "When someone on X mentions you in a post or reply, you'll find it here",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}

import 'package:flutter/material.dart';

import 'home_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Theme.of(context).colorScheme.background,
          ),
          Positioned(
            right: 90,
            left: 90,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/jeff.png',
                    height: 230,
                    width: 240,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/icons/icons8-twitter-24.png',
                  color: Theme.of(context).colorScheme.primary,
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Jephtha Owusu Ansah',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 30,
              right: 124,
              left: 124,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DefaultTabController(
                              length: 2, child: HomePage())));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15),
                    ),
                  ),
                ),
              ))
        ],
      )),
    );
  }
}

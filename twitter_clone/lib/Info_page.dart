import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import 'Info_page.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0;
  final pageController = PageController(initialPage: 0);

  List<String> tabNames = ['For you', 'Following'];

  TextStyle selectedTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  TextStyle defaultTextStyle = const TextStyle(
    color: Colors.white70,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  void selectTab(int index) {
    setState(() {
      selectedTabIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
          // ... (your app bar code remains the same)
          ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            // For You Page
            color: Colors.lightGreen.shade100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'For You Page',
                    style: TextStyle(fontSize: 20),
                  ),
                  // Add your For You page content here
                ],
              ),
            ),
          ),
          Container(
            // Following Page
            color: Colors.pink.shade100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Following Page',
                    style: TextStyle(fontSize: 20),
                  ),
                  // Add your Following page content here
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[900],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tabNames.asMap().entries.map((entry) {
            final index = entry.key;
            final tabName = entry.value;
            return GestureDetector(
              onTap: () {
                selectTab(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  tabName,
                  style: selectedTabIndex == index
                      ? selectedTextStyle
                      : defaultTextStyle,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

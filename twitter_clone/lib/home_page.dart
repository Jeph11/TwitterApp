import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/bottomNav/Notification.dart';
import 'package:twitter_clone/bottomNav/community.dart';
import 'package:twitter_clone/bottomNav/home.dart';
import 'package:twitter_clone/bottomNav/inbox.dart';
import 'package:twitter_clone/bottomNav/search.dart';
import 'package:twitter_clone/float_Act.dart';
import 'package:twitter_clone/my_drawer.dart';

import 'Info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0;
  final pageController = PageController(initialPage: 0);
  List<String> tabNames = ['For you', 'Folllowing'];
  int currentIndex = 0;

  final screens = [
    const HomeIcon(),
    const SearchIcon(),
    const CommunityIcon(),
    const NotificationIcon(),
    const InboxIcon(),
  ];

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
    final defaultTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 13,
      fontWeight: FontWeight.normal,
    );

    final selectedTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 13,
      fontWeight: FontWeight.bold,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: const MyDrawer(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                return Scaffold.of(context).openDrawer();
              },
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.lightBlue,
                backgroundImage: AssetImage('assets/images/jeff.png'),
              ),
            );
          }),
          backgroundColor: Theme.of(context).colorScheme.background,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          elevation: 1,
          shadowColor: Colors.grey,
          title: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/xlogo.png',
              scale: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: tabNames.asMap().entries.map((entry) {
                    final index = entry.key;
                    final tabName = entry.value;
                    return GestureDetector(
                      onTap: () {
                        selectTab(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Text(
                                tabName,
                                style: selectedTabIndex == index
                                    ? selectedTextStyle
                                    : defaultTextStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 3, // Height of the underline
                              width: 45, // Width of the underline
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: selectedTabIndex == index
                                    ? Colors.blue[
                                        500] // Color of the underline when selected
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            Container(
              // For You Page

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.grey.withOpacity(0.5))),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 2,
              currentIndex: currentIndex,
              onTap: (value) {},
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/homeee.png',
                    width: 30,
                    height: 30,
                    color: Theme.of(context).colorScheme.primary,
                    scale: 2,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/search.png',
                    scale: 2,
                  ),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/personsss.png',
                    scale: 4,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'person',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/notification.png',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/inbox.png',
                    scale: 22,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'inbox',
                )
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FloatAct()));
          },
          tooltip: 'New Tweet',
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

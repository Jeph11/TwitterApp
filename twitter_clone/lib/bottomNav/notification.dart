import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/bottomNav/search.dart';
import 'package:twitter_clone/home_page.dart';
import 'package:twitter_clone/notificationtabs/all.dart';
import 'package:twitter_clone/notificationtabs/mention.dart';
import 'package:twitter_clone/notificationtabs/verified.dart';

import '../float_act.dart';
import '../my_drawer.dart';
import 'community.dart';
import 'inbox.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex = 0;
  List<String> tabNames = ['All', 'Verified', 'Mentions'];

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
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabNames.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
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
            icon: SizedBox(
              width: 150.0,
              height: 150.0,
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/jeff.png',
                    height: 220,
                    width: 220,
                  ),
                ),
              ),
            ),
          );
        }),
        backgroundColor: Theme.of(context).colorScheme.background,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 1,
        shadowColor: Colors.grey,
        title: Text(
          'Notification',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blue,
                tabs: List.generate(tabNames.length, (index) {
                  final tabName = tabNames[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _tabController.animateTo(index);
                      });
                    },
                    child: Tab(
                      child: Text(
                        tabName,
                        style: selectedTabIndex == index
                            ? selectedTextStyle
                            : defaultTextStyle,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: const [AllPage(), VerifiedPage(), MentionPage()]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.5))),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 2,
            items: [
              BottomNavigationBarItem(
                icon: InkWell(
                    child: Image.asset(
                      'assets/icons/homenf.png',
                      width: 30,
                      height: 30,
                      color: Theme.of(context).colorScheme.primary,
                      scale: 2,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }),
                // activeIcon: Image.asset(
                //   'assets/icons/homef.png',
                //   width: 30,
                //   height: 30,
                //   color: Theme.of(context).colorScheme.primary,
                //   scale: 2,
                // ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                    child: Image.asset(
                      'assets/icons/search.png',
                      scale: 1,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchIcon()));
                    }),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  child: Image.asset(
                    'assets/icons/persons.png',
                    scale: 4,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CommunityIcon()));
                  },
                ),
                label: 'persons',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  child: Image.asset(
                    'assets/icons/notification.png',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationIcon()));
                  },
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  child: Image.asset(
                    'assets/icons/inbox.png',
                    scale: 22,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InboxIcon()));
                  },
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
    ));
  }
}

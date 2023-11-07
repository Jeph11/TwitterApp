import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottomNav/community.dart';
import 'bottomNav/inbox.dart';
import 'bottomNav/notification.dart';
import 'bottomNav/search.dart';
import 'float_act.dart';
import 'hometabs/follower.dart';
import 'hometabs/for_you.dart';

import 'my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex = 0;
  List<String> tabNames = ['For you', 'Folllowing'];

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
              iconSize: 50,
              icon: const CircleAvatar(
                radius: 100.5,
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
          title: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/icons8-twitter-24.png',
              color: Theme.of(context).colorScheme.primary,
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
          )),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              ForYouPage(),
              FollowingPage(),
            ]),
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
                icon: Image.asset(
                  'assets/icons/homenf.png',
                  width: 30,
                  height: 30,
                  color: Theme.of(context).colorScheme.primary,
                  scale: 2,
                ),
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
                activeIcon: Image.asset(
                  'assets/icons/personnn.png',
                  width: 30,
                  height: 30,
                  color: Theme.of(context).colorScheme.primary,
                  scale: 2,
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
                            builder: (context) => const DefaultTabController(
                                length: 3, child: NotificationIcon())));
                  },
                ),
                label: 'notification',
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

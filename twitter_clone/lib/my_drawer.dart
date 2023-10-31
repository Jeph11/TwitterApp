import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:twitter_clone/theme/theme_manager.dart';

import 'home_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final ThemeManager _themeManager = ThemeManager();

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 2,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.lightBlue,
                        backgroundImage: AssetImage(
                          'assets/images/jeff.png',
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/icons/addpersonsss.png',
                      width: 30,
                      height: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 18,
                ),
                child: Text(
                  'Jephtha Owusu Ansah',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                ),
                child: Text(
                  '@ojephthans',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onDoubleTap: () {},
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '18 ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          TextSpan(
                            text: 'Following',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ])),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onDoubleTap: () {},
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '40K ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          TextSpan(
                            text: 'Followers',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ])),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/person.png',
                      width: 22,
                      height: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: const Text(
                      'Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/icons8-twitter-24.png',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: const Text(
                      'Premium',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/bookmark.png',
                      width: 32,
                      height: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: const Text(
                      'Bookmarks',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.update),
                    title: const Text(
                      'Lists',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.update),
                    title: const Text(
                      'Spaces',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.update),
                    title: const Text(
                      'Monetization',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  ListTile(
                    title: Text(
                      'Settings and Support',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Image.asset(
                      'assets/icons/arrowd.png',
                      color: Colors.blue,
                      width: 14,
                      height: 14,
                    ),
                  )
                ]),
              ),
              Switch(
                  value: _themeManager.themeMode == ThemeMode.dark,
                  onChanged: (newvalue) {
                    _themeManager.toggleTheme(newvalue);
                  })
            ],
          ),
        ),
      );
}

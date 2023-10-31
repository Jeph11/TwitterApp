import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
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

  void selectTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
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
            appBar: AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    return Scaffold.of(context).openDrawer();
                  },
                  icon: const CircleAvatar(
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
              title: Text(
                'Notification',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
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

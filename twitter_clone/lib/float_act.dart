import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:twitter_clone/home_page.dart';

class FloatAct extends StatelessWidget {
  const FloatAct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  width: 60,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: const Center(
                    child: Text(
                      'Post',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.lightBlue,
                    backgroundImage: AssetImage(
                      'assets/images/jeff.png',
                    ),
                  ),
                ),
                Container(
                    width: 90,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Public',
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                          ),
                          Image.asset(
                            'assets/icons/arrowd.png',
                            color: Colors.blue,
                            width: 5,
                            height: 5,
                          ),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}

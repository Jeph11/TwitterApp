import 'package:flutter/material.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({Key? key}) : super(key: key);

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  List<Map<String, dynamic>> posts = [
    {
      'name': 'Robert Scoble',
      'comment': 'followed you',
      'content': "Zoo in the 90's",
      'Profile': 'assets/images/profile_pic2.png',
      'iconAsset': 'assets/icons/personff.png',
      'iconWidth': 20.0,
      'iconHeight': 30.0,
    },
    {
      'name': 'John Doe',
      'comment': 'liked a post your were mention in',
      'content': 'born to hustle',
      'profile': 'assets/images/profile_pic.png',
      'iconAsset': 'assets/icons/liket.png',
      'iconWidth': 20.0,
      'iconHeight': 30.0,
    },
    {
      'name': 'Goodness',
      'comment': 'Reposted your reply',
      'content': 'God can help you',
      'profile': 'assets/images/person02.png',
      'iconAsset': 'assets/icons/retweetgg.png',
      'iconWidth': 20.0,
      'iconHeight': 40.0,
    },
    {
      'name': 'John the_BELOVED',
      'comment': 'Reposted your reply',
      'content': 'God can choose to help a MAN',
      'profile': 'assets/images/profile_pic1.png',
      'iconAsset': 'assets/icons/retweetgg.png',
      'iconWidth': 20.0,
      'iconHeight': 40.0,
    },
    {
      'name': 'John the_BELOVED',
      'comment': 'liked your post',
      'content': 'PRAYER IS LIFE',
      'profile': 'assets/images/profile_pic1.png',
      'iconAsset': 'assets/icons/liket.png',
      'iconWidth': 20.0,
      'iconHeight': 30.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            // Extract data for the current post
            final post = posts[index];
            final profileImageAsset =
                post['profile'] ?? 'assets/images/profile_pic.png';
            final iconAsset = post['iconAsset'];
            final iconWidth = post['iconWidth'];
            final iconHeight = post['iconHeight'];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset(
                            iconAsset,
                            width: iconWidth,
                            height: iconHeight,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.5,
                                  backgroundColor: Colors.lightBlue,
                                  backgroundImage:
                                      AssetImage(profileImageAsset),
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                Image.asset(
                                  'assets/icons/three-dots.png',
                                  scale: 70,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                " ${post['name']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text(
                                " ${post['comment']}",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            " ${post['time']}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            " ${post['content']}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

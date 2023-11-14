import 'package:flutter/material.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({Key? key}) : super(key: key);

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  // Define your data source here
  List<Map<String, dynamic>> posts = [
    {
      'name': 'Robert Scoble',
      'username': 'ojephthans',
      'time': '1d',
      'content': 'Trading is not for everyone',
      'Profile': 'assets/images/profile_pic.png',
      'imageAsset': 'assets/images/photo2.jpg',
    },
    {
      'name': 'John Doe',
      'username': 'johndoe',
      'time': '2d',
      'content': 'Myth or Fact',
      'profile': 'assets/images/jeff.png',
      'imageAsset': 'assets/images/photo1.jpg',
    },

    {
      'name': 'Elvis Owusu',
      'username': 'own_man',
      'time': '4d',
      'content': 'Condition For Receiving Marvelous Light',
      'profile': 'assets/images/person01.png',
      'imageAsset': 'assets/images/photo5.jpg',
    },
    // Add more posts as needed
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
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          radius: 20.5,
                          backgroundColor: Colors.lightBlue,
                          backgroundImage: AssetImage(profileImageAsset),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: SizedBox(
                              width: 320,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " ${post['name']}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      Text(
                                        " @${post['username']}",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                      Text(
                                        " ${post['time']}",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ],
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
                          ),
                          const SizedBox(
                            height: 5,
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
                          Container(
                            clipBehavior: Clip.none,
                            width: 300,
                            height: 200,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                post['imageAsset'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 280,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/icons/tweet.png',
                                  scale: 15,
                                ),
                                Image.asset(
                                  'assets/icons/retweettt.png',
                                  scale: 15,
                                ),
                                Image.asset(
                                  'assets/icons/likes.png',
                                  scale: 15,
                                ),
                                Image.asset(
                                  'assets/icons/viewss.png',
                                  height: 16,
                                ),
                                Image.asset(
                                  'assets/icons/bookmark.png',
                                  color: Theme.of(context).colorScheme.primary,
                                  scale: 1.1,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  // Your existing post UI code here, but use 'post' data
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

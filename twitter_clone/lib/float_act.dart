import 'package:flutter/material.dart';

import 'package:twitter_clone/home_page.dart';

class FloatAct extends StatefulWidget {
  const FloatAct({super.key});

  @override
  State<FloatAct> createState() => _FloatActState();
}

class _FloatActState extends State<FloatAct> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  void updatedText(String newText) {
    setState(() {
      _textEditingController.text = newText;
    });
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    width: 200,
                    height: 105.0,
                    child: EditableText(
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      cursorColor: Colors.black,
                      backgroundCursorColor: Colors.transparent,
                      maxLines: 4,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

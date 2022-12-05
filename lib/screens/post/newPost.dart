import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/screens/home/root.dart';
import 'package:talkapp/commonWidgets/find_topics.dart';

class NewPost extends StatefulWidget {
  String? topic;
  NewPost({Key? key, this.topic}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  late TextEditingController topicController = TextEditingController();
  List<Color> gradientActive = [
    Colors.purple,
    Colors.red,
  ];
  List<Color> gradientInActive = [
    Colors.grey,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
            splashColor: kBackgroundColor,
            highlightColor: kBackgroundColor,
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Root(),
                  isIos: true,
                  duration: Duration(milliseconds: 200),
                ),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 25,
            )),
        actions: [
          InkWell(
            splashColor: kBackgroundColor,
            highlightColor: kBackgroundColor,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Root(),
                  isIos: true,
                  duration: Duration(milliseconds: 200),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8, right: 10, bottom: 8),
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: topicController.text.isEmpty
                          ? gradientInActive
                          : gradientActive)),
              child: Center(
                child: Text(
                  "Post",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              splashColor: kBackgroundColor,
              highlightColor: kBackgroundColor,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Root(),
                    isIos: true,
                    duration: Duration(milliseconds: 200),
                  ),
                );
              },
              icon: const Icon(
                Icons.save,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            findTopics(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "${widget.topic}",
                      style: kBodyText.copyWith(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: TextFormField(
                controller: topicController,
                maxLines: null,
                decoration: InputDecoration(border: InputBorder.none),
                style: kBodyText,
                cursorColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    topicController.text.length;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/screens/post/cards.dart';
import 'package:talkapp/commonWidgets/divider.dart';
import 'package:talkapp/commonWidgets/find_topics.dart';
import 'package:talkapp/commonWidgets/my_text_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Image.asset(
                "assets/images/splash.png",
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            Text(
              "Create a Topic to discuss\nor just browse topics",
              style: kBodyText.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Create a Topic by writing some post",
              style: kBodyText.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => Cards(),
                ),
              ),
              child: MyGradientTextButton(
                  buttonName: "Post Something", onTap: null),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Explore topics",
              style: kBodyText.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            findTopics(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Trending Topics",
              style: kBodyText.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "#Space Science",
              style: kBodyText.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "1124 Active Posts",
              style: kBodyText.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: MyDivider(
                color: Colors.white,
              ),
            ),
            Text(
              "#Elon Musk",
              style: kBodyText.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "4378 Active Posts",
              style: kBodyText.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: MyDivider(
                color: Colors.white,
              ),
            ),
            Text(
              "#Talk App",
              style: kBodyText.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "2537 Active Posts",
              style: kBodyText.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

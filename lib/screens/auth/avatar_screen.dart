import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/screens/home/root.dart';
import 'package:talkapp/commonWidgets/my_text_button.dart';

class AvatarScreen extends StatefulWidget {
  AvatarScreen({Key? key, required this.saved}) : super(key: key);
  bool saved = false;

  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Create Your Avatar',
              style: kHeadline,
            ),
            SizedBox(
              height: 5,
            ),
            FluttermojiCircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 100,
            ),
            SizedBox(),
            Center(
              child: Text(
                'This is your Avatar.\nIts a new way to be you on Talk App',
                style: kBodyText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            widget.saved
                ? MyTextButton(
                    buttonName: 'Edit',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomizeAvatarScreen(),
                        ),
                      );
                    },
                    bgColor: Colors.grey.shade600,
                    textColor: Colors.white)
                : Container(),
            MyGradientTextButton(
              buttonName: widget.saved ? 'Continue' : 'Create',
              onTap: () {
                widget.saved
                    ? Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Root(),
                        ),
                      )
                    : Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomizeAvatarScreen(),
                        ),
                      );
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomizeAvatarScreen extends StatefulWidget {
  const CustomizeAvatarScreen({Key? key}) : super(key: key);

  @override
  _CustomizeAvatarScreenState createState() => _CustomizeAvatarScreenState();
}

class _CustomizeAvatarScreenState extends State<CustomizeAvatarScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        height: _height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.purple.shade200,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: ListView(
                children: [
                  FluttermojiSaveWidget(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => AvatarScreen(
                            saved: true,
                          ),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange.shade500,
                        ),
                        child: Center(
                            child: Text(
                          'Save',
                          style: kHeadline.copyWith(
                              fontSize: 20, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  FluttermojiCircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.purple.shade200,
                  ),
                ],
              ),
            ),
            FluttermojiCustomizer(
              scaffoldWidth: _width,
              scaffoldHeight: _height * 0.503,
              autosave: false,
              theme: FluttermojiThemeData(
                  primaryBgColor: kBackgroundColor,
                  labelTextStyle: TextStyle(color: Colors.white),
                  secondaryBgColor: kBackgroundColor.withOpacity(0.6),
                  iconColor: Colors.white,
                  boxDecoration: BoxDecoration(
                      boxShadow: [BoxShadow()],
                      borderRadius: BorderRadius.circular(30))),
            ),
          ],
        ),
      ),
    );
  }
}

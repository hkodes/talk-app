import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/screens/auth/signup_screen.dart';
import '../../commonWidgets/my_text_button.dart';
import '../auth/login_screen.dart';
import 'components/splash_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Lorem Ipsum Dolor",
      "subtext":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": "assets/images/splash.png"
    },
    {
      "text": "Lorem Ipsum Dolor",
      "subtext":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": "assets/images/splash.png"
    },
    {
      "text": "Lorem Ipsum Dolor",
      "subtext":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": "assets/images/splash.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      image: splashData[index]["image"],
                      text: splashData[index]["text"],
                      subtext: splashData[index]["subtext"],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MyGradientTextButton(
                      buttonName: 'Get Started',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: MyTextButton(
                      buttonName: 'Already Have An Account?',
                      bgColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      textColor: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }

  AnimatedContainer buildDot({int? index}) {
    const kAnimationDuration = Duration(milliseconds: 200);

    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 6),
      height: 7,
      width: currentPage == index ? 7 : 7,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/screens/auth/setup_screen.dart';
import 'package:talkapp/commonWidgets/my_birthday_field.dart';
import 'package:talkapp/commonWidgets/my_text_button.dart';

import '../../constants.dart';
import '../../commonWidgets/my_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController dobctlr = TextEditingController();
  bool _checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                  color: kBackgroundColor),
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 100,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MyTextField(
                hintText: 'Nickname / Userame',
                inputType: TextInputType.emailAddress),
            MyBirthdayField(bdayCont: dobctlr),
            SizedBox(
              height: 10,
            ),
            Text(
              "Gender",
              style: kHeadline.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.29,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          )),
                      child: Center(
                        child: Text(
                          "Male",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    const VerticalDivider(width: 2, color: Colors.black),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.29,
                      color: const Color(0xFF424242),
                      child: Center(
                        child: Text(
                          "Female",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      width: 2,
                      color: Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.29,
                      decoration: const BoxDecoration(
                          color: Color(0xFF424242),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )),
                      child: Center(
                        child: Text(
                          "Non-Binary",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 90,
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: kBackgroundColor,
                    onTap: () {
                      setState(() {
                        _checkValue = !_checkValue;
                      });
                    },
                    child: Container(
                        height: 30,
                        width: 33,
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: _checkValue
                            ? Icon(
                                Icons.check,
                                size: 12.0,
                                color: Colors.white,
                              )
                            : null),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'I accept Terms & privacy policy',
                    style: kBodyText.copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MyGradientTextButton(
              buttonName: 'Next',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SetUpScreen(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

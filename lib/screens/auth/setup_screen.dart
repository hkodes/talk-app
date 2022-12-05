import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/screens/auth/verify_otp.dart';
import 'package:talkapp/commonWidgets/widget.dart';

import '../../constants.dart';

class SetUpScreen extends StatefulWidget {
  const SetUpScreen({Key? key}) : super(key: key);

  @override
  _SetUpScreenState createState() => _SetUpScreenState();
}

class _SetUpScreenState extends State<SetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'Setting Up Your Login Credentials',
              style: kHeadline,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
                hintText: 'Please enter your email',
                inputType: TextInputType.name),
            MyPasswordField(
              hintText: 'Password',
            ),
            MyPasswordField(
              hintText: 'Re-enter Password',
            ),
            SizedBox(
              height: 150,
            ),
            MyGradientTextButton(
              buttonName: 'Done',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => VerifyOtpScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

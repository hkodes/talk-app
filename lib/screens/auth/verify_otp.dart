import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:talkapp/screens/auth/avatar_screen.dart';
import 'package:talkapp/commonWidgets/my_text_button.dart';

import '../../constants.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
              height: 90,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Verification',
                style: kHeadline,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Please Enter The 4-Digit Verification Code That We\nSent To Your Email.',
              style: kBodyText.copyWith(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            OtpTextField(
              numberOfFields: 4,
              enabledBorderColor: const Color(0xFF9E9E9E),
              borderRadius: BorderRadius.circular(16),
              showFieldAsBox: true,
              focusedBorderColor: Colors.grey,
              fieldWidth: 70,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "didn't recieve code? resend code",
              style: kBodyText.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 90,
            ),
            MyGradientTextButton(
              buttonName: 'Send',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AvatarScreen(
                        saved: false,
                      ),
                    ));
              },
            ),
            FluttermojiCircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 0,
            ),
          ],
        ),
      ),
    );
  }
}

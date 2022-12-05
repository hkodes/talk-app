import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/screens/auth/setup_screen.dart';
import 'package:talkapp/screens/auth/signup_screen.dart';
import 'package:talkapp/screens/home/root.dart';
import '../../constants.dart';
import '../../commonWidgets/my_password_field.dart';
import '../../commonWidgets/my_text_button.dart';
import '../../commonWidgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Good To See You',
                style: kHeadline,
              ),
              const SizedBox(
                height: 30,
              ),
              const MyTextField(
                  hintText: 'Email Address',
                  inputType: TextInputType.emailAddress),
              const SizedBox(
                height: 10,
              ),
              const MyPasswordField(
                hintText: 'Password',
              ),
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot Password?',
                  style: kBodyText,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              MyGradientTextButton(
                buttonName: 'Login',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Root(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "didn't have an account?  signup",
                    style: kBodyText.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

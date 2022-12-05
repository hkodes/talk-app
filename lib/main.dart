import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkapp/screens/splash/splash_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kBackgroundColor,
      debugShowCheckedModeBanner: false,
      title: 'Talk App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: kBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

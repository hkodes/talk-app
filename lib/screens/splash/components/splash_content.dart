// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.subtext,
    required this.image,
  }) : super(key: key);
  final String? text, subtext, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Spacer(
          flex: 1,
        ),
        Image.asset(
          image!,
          height: 265,
          width: 235,
        ),
        const Padding(padding: EdgeInsets.all(7)),
        Text(text!, textAlign: TextAlign.center, style: kHeadline),
        const Spacer(flex: 1),
        const Padding(padding: EdgeInsets.all(7)),
        Text(
          subtext!,
          style: kBodyText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

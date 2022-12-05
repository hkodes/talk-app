import 'package:flutter/material.dart';

import '../constants.dart';

Widget findTopics() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    height: 55,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(18)),
    child: Center(
      child: TextField(
        style: kBodyText.copyWith(
          color: Colors.white,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        cursorColor: Colors.purple,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 8, left: 20),
          hintText: "Find Topics",
          hintStyle: kBodyText.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}

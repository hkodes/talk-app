import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MyBirthdayField extends StatefulWidget {
  const MyBirthdayField({Key? key, required this.bdayCont}) : super(key: key);
  final TextEditingController bdayCont;

  @override
  _MyBirthdayFieldState createState() => _MyBirthdayFieldState();
}

class _MyBirthdayFieldState extends State<MyBirthdayField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        cursorColor: kBackgroundColor,
        style: kBodyText.copyWith(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 30,
            ),
          ),
          focusColor: kBackgroundColor,
          contentPadding: EdgeInsets.all(20),
          hintText: 'Birthday',
          hintStyle: kBodyText.copyWith(fontSize: 18),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        readOnly: true,
        keyboardType: TextInputType.phone,
        onTap: () => showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: GestureDetector(
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.white,
                      initialDateTime: DateTime(2000, 10, 12),
                      onDateTimeChanged: (DateTime newdate) {
                        setState(() {
                          widget.bdayCont.text = newdate.day.toString() +
                              '/' +
                              newdate.month.toString() +
                              '/' +
                              newdate.year.toString();
                        });
                      },
                      maximumYear: 2002,
                      minimumYear: 1800,
                      maximumDate: DateTime(2002, 03, 12),
                      mode: CupertinoDatePickerMode.date,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ));
            }),
        controller: widget.bdayCont,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:talkapp/data.dart';

import '../../constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Gifts Received From",
            style:
                kBodyText.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (content, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kSecondaryColor),
                            child: Image.asset(
                              users[index].image!,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20, top: 7),
                            child: Text(
                              users[index].name!,
                              style: kBodyText.copyWith(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    })),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Chats",
            style:
                kBodyText.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kSecondaryColor),
                          child: Image.asset(
                            users[index].image!,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              users[index].name!,
                              style: kBodyText,
                            ),
                            Text(
                              users[index].chat!.length > 25
                                  ? "${users[index].chat!.substring(0, 29)}..."
                                  : users[index].chat!,
                              style: kBodyText.copyWith(fontSize: 17),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/screens/post/newPost.dart';

import '../home/widgets/advancedSearch.dart';

class PostTopic extends StatefulWidget {
  const PostTopic({Key? key}) : super(key: key);

  @override
  _PostTopicState createState() => _PostTopicState();
}

class _PostTopicState extends State<PostTopic> {
  final List<String> searchableList = [
    "Orange",
    "Apple",
    "Banana",
    "Mango Orange",
    "Carrot Apple",
    "Yellow Watermelon",
    "Zhe Fruit",
    "White Oats",
    "Dates",
    "Raspberry Blue",
    "Green Grapes",
    "Red Grapes",
    "Dragon Fruit"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 60.0, left: 10, right: 10),
        child: AdvancedSearch(
          searchItems: searchableList,
          singleItemHeight: 100,
          borderColor: Colors.black,
          minLettersForSearch: 0,
          fontSize: 14,
          borderRadius: 12.0,
          hintText: 'Search Me',
          cursorColor: Colors.blueGrey,
          autoCorrect: false,
          focusedBorderColor: kBackgroundColor,
          searchResultsBgColor: Color(0xFAFAFA),
          disabledBorderColor: kBackgroundColor,
          enabledBorderColor: Colors.black,
          enabled: true,
          inputTextFieldBgColor: Colors.white10,
          clearSearchEnabled: true,
          searchMode: SearchMode.CONTAINS,
          showListOfResults: true,
          unSelectedTextColor: Colors.black54,
          verticalPadding: 10,
          horizontalPadding: 10,
          searchItemsWidget: searchWidget,
          onItemTap: (index, value) {
            Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => NewPost(
                    topic: value,
                  ),
                ));
          },
          onSearchClear: () {},
          onSubmitted: (value, value2) {},
          onEditingProgress: (value, value2) {},
        ),
      ),
    );
  }

  Widget searchWidget(String text) {
    return ListTile(
      title: Text(
        "Trending in $text",
        style: const TextStyle(
            fontWeight: FontWeight.normal, fontSize: 13, color: Colors.grey),
      ),
      subtitle: Text(
        "#$text",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}

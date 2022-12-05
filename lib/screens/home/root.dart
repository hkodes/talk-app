import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/screens/chats/chat.dart';
import 'package:talkapp/screens/explore/explore.dart';
import 'package:talkapp/screens/home/home.dart';
import 'package:talkapp/screens/home/profile.dart';
import 'package:talkapp/screens/post/postTopic.dart';

class Root extends StatefulWidget {
  Root({Key? key, this.futureIndex}) : super(key: key);
  int? futureIndex = 0;
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  final _page4 = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        backgroundColor: kBackgroundColor,
        buttonColor: Colors.grey,
        buttonSelectedColor: Colors.grey,
        fabColors: const [Colors.red, Colors.purple],
        fabIcon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        buttonData: [
          PandaBarButtonData(id: 0, icon: Icons.home_filled),
          PandaBarButtonData(id: 1, icon: Icons.explore),
          PandaBarButtonData(id: 2, icon: Icons.chat_sharp),
          PandaBarButtonData(id: 3, icon: Icons.account_circle),
        ],
        onChange: (id) {
          if (_currentIndex == id) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => Root(
                  futureIndex: _currentIndex,
                ),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          } else {
            setState(() {
              widget.futureIndex = id;
              _currentIndex = id;
            });
          }
        },
        onFabButtonPressed: () {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => PostTopic()),
          );
        },
      ),
      body: IndexedStack(
        index: widget.futureIndex ?? _currentIndex,
        children: <Widget>[
          Navigator(
            key: _page1,
            onGenerateRoute: (route) => CupertinoPageRoute(
              settings: route,
              builder: (context) => HomePage(),
            ),
          ),
          Navigator(
            key: _page2,
            onGenerateRoute: (route) => CupertinoPageRoute(
              settings: route,
              builder: (context) => ExplorePage(),
            ),
          ),
          Navigator(
            key: _page3,
            onGenerateRoute: (route) => CupertinoPageRoute(
              settings: route,
              builder: (context) => ChatPage(),
            ),
          ),
          Navigator(
            key: _page4,
            onGenerateRoute: (route) => CupertinoPageRoute(
              settings: route,
              builder: (context) => ProfilePage(),
            ),
          ),
        ],
      ),
    );
  }
}

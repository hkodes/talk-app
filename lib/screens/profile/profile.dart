import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/commonWidgets/giftModal.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/data.dart';

import '../post/cards.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final List<Widget> profileTabs = [
    const Tab(text: 'My Posts'),
    const Tab(text: 'Saved Posts'),
    const Tab(text: 'Drafts'),
  ];
  late TabController _tabController;
  final AppinioSwiperController swipeController = AppinioSwiperController();
  List<ExampleCard> cards = [];
  List<ExampleCard> savedPost = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _loadCards();
    super.initState();
  }

  void _loadCards() {
    for (UserModel user in users) {
      cards.add(
        ExampleCard(
          candidate: user,
          profile: true,
        ),
      );
      savedPost.add(
        ExampleCard(
          candidate: user,
          profile: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
              highlightColor: kBackgroundColor,
              splashColor: kBackgroundColor,
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 28,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/p4.png',
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width * 0.14,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(users[0].name.toString(),
                    style: kBodyText.copyWith(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mode_edit,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
              style: kBodyText.copyWith(
                fontSize: 17,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.male,
                    color: Colors.amber,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Gender:   Male",
                    style: kBodyText,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.flag,
                    color: Colors.amber,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Country:   America",
                    style: kBodyText,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 30),
              child: Row(
                children: [
                  const Icon(
                    Icons.wallet_giftcard,
                    color: Colors.amber,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Birthday:   22/09/2000",
                    style: kBodyText,
                  )
                ],
              ),
            ),
            Text(
              'Gift Received',
              style: kBodyText.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              //alignment:new Alignment(x, y)
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/g1.png'),
                ),
                const Positioned(
                  left: 60.0,
                  child: Image(
                    image: AssetImage('assets/images/g2.png'),
                  ),
                ),
                const Positioned(
                  left: 80.0,
                  child: Image(
                    image: AssetImage('assets/images/g3.png'),
                  ),
                ),
                const Positioned(
                  left: 100.0,
                  child: Image(
                    image: AssetImage('assets/images/g4.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.65),
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Text(
                      "+ 120 More",
                      style: kBodyText.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              controller: _tabController,
              overlayColor: MaterialStateProperty.all<Color>(kBackgroundColor),
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelStyle:
                  kBodyText.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              tabs: profileTabs,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: AppinioSwiper(
                    unlimitedUnswipe: true,
                    controller: swipeController,
                    cards: cards,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: AppinioSwiper(
                          unlimitedUnswipe: true,
                          controller: swipeController,
                          cards: savedPost,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: 110,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.reply_all,
                                  size: 18,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Reply',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              giftPopUp(context);
                            },
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 40),
                                width: 60,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [Colors.red, Colors.purple]),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Icon(
                                    Icons.wallet_giftcard,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),
                )
              ][_tabController.index],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkapp/commonWidgets/giftModal.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/screens/home/widgets/postDetail.dart';
import '../../data.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final AppinioSwiperController controller = AppinioSwiperController();
  List<ExampleCard> cards = [];

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  void _loadCards() {
    for (UserModel user in users) {
      cards.add(
        ExampleCard(
          candidate: user,
          profile: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: kBackgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: AppinioSwiper(
              unlimitedUnswipe: true,
              controller: controller,
              cards: cards,
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.save_alt,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Save for Later',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final UserModel candidate;
  final bool profile;

  ExampleCard({Key? key, required this.candidate, required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => PostDetail(user: candidate),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 45, 51, 61),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: ListView(
          children: [
            profile!
                ? SizedBox(
                    height: 15,
                  )
                : Container(),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                profile!
                    ? Container()
                    : Image.asset(
                        candidate.image!,
                        height: 60,
                      ),
                const SizedBox(
                  width: 20,
                ),
                profile!
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            candidate.name!,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Flag.fromCode(
                            FlagsCode.US,
                            height: 20,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    candidate.date!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                candidate.content!,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wallet_giftcard,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        candidate.gift.toString(),
                        style: kBodyText,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        candidate.messages.toString(),
                        style: kBodyText,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

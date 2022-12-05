import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:talkapp/constants.dart';
import 'package:talkapp/data.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final CountDownController countDown = new CountDownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Active Posts",
              style:
                  kBodyText.copyWith(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            height: MediaQuery.of(context).size.height * 0.28,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSecondaryColor,
                  ),
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "${users[0].date}",
                            style: kBodyText.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      Text(
                        "#${users[0].topic}",
                        style: kBodyText.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${users[0].content}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: kBodyText.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.card_giftcard_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "${users[0].gift}",
                                style: kBodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "${users[0].messages}",
                                style: kBodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSecondaryColor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Post Something",
                          style: kBodyText.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 90,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Active Topics",
              style:
                  kBodyText.copyWith(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5 / 2,
                    crossAxisSpacing: 15),
                itemCount: topics.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSecondaryColor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          topics[index].name.length > 10
                              ? "#${topics[index].name.substring(0, 10)}..."
                              : "#${topics[index].name}",
                          style: kBodyText.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Your topic expires in:",
                          style: kBodyText.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        NeonCircularTimer(
                          isReverse: true,
                          onComplete: () {
                            countDown.restart();
                          },
                          textFormat: TextFormat.HH_MM_SS,
                          textStyle: kBodyText.copyWith(fontSize: 20),
                          width: 120,
                          controller: countDown,
                          duration: topics[index].duration,
                          strokeWidth: 5,
                          isTimerTextShown: true,
                          neumorphicEffect: true,
                          outerStrokeColor: kSecondaryColor,
                          innerFillGradient: LinearGradient(
                              colors: [Colors.red, Colors.purple]),
                          neonGradient: LinearGradient(
                              colors: [Colors.red, Colors.purple]),
                          strokeCap: StrokeCap.round,
                          innerFillColor: Colors.black12,
                          backgroudColor: kSecondaryColor,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

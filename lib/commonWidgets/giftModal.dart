import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

Future<dynamic> giftPopUp(context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => Container(
        decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (content, i) {
                    return Column(children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Image(
                              fit: BoxFit.fill,
                              height: 50,
                              width: 80,
                              image: AssetImage("assets/images/g${i + 1}.png")),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Awesome",
                                style: kBodyText.copyWith(
                                    decoration: TextDecoration.none,
                                    fontSize: 18),
                              ),
                              Text(
                                "Lorem ipsum dolor sit",
                                style: kBodyText.copyWith(
                                    decoration: TextDecoration.none,
                                    fontSize: 18),
                              ),
                              Text(
                                "10 pcs",
                                style: kBodyText.copyWith(
                                    decoration: TextDecoration.none,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ]);
                  }),
            ),
            Container(
              height: 50,
              width: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Coins: ',
                    style: kBodyText.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Image(
                      height: 25,
                      width: 25,
                      image: AssetImage('assets/images/coin.png')),
                  Text(
                    ' 500',
                    style: kBodyText.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        )),
  );
}

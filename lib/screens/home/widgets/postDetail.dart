import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data.dart';
import '../../post/cards.dart';

class PostDetail extends StatefulWidget {
  final UserModel user;

  const PostDetail({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 45, 51, 61),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              highlightColor: const Color.fromARGB(255, 45, 51, 61),
              onTap: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => Cards(),
                ),
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: const Color.fromARGB(255, 45, 51, 61),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(
                  widget.user.image!,
                  height: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.name!,
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
                Text(
                  widget.user.date!,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.user.content!,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
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
                Container(
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
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

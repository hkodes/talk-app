import 'dart:ui';

import 'package:talkapp/constants.dart';

class UserModel {
  String? name;
  String? image;
  String? date;
  String? topic;
  List<String>? topics;
  String? content;
  int? gift;
  int? messages;
  String? chat;

  UserModel({
    this.name,
    this.image,
    this.date,
    this.topics,
    this.topic,
    this.content,
    this.gift,
    this.messages,
    this.chat,
  });
}

class TopicModel {
  String name;
  int duration;

  TopicModel({required this.name, required this.duration});
}

List<UserModel> users = [
  UserModel(
      name: 'Clara',
      image: 'assets/images/p1.png',
      date: '22/10/21',
      topic: 'Universe',
      topics: ['Space Science', 'JWT', 'Universs'],
      content:
          "The National Aeronautics and Space Administration is an independent agency of the US federal government responsible for the civil space program, aeronautics research, and space research. Image result for nasa National Aeronautics and Space Administration NASA stands for National Aeronautics and Space Administration. NASA was started on October 1, 1958, as a part of the United States government. NASA is in charge of U.S. science and technology that has to do with airplanes or space.",
      gift: 24,
      messages: 4,
      chat: 'Nice to meet you 😊. Glad you get it'),
  UserModel(
      name: 'James',
      image: 'assets/images/p2.png',
      date: '22/10/21',
      topic: 'Orange',
      topics: ['Space Science', 'JWT', 'Universs'],
      content:
          "The National Aeronautics and Space Administration is an independent agency of the US federal government responsible for the civil space program, aeronautics research, and space research. Image result for nasa National Aeronautics and Space Administration NASA stands for National Aeronautics and Space Administration. NASA was started on October 1, 1958, as a part of the United States government. NASA is in charge of U.S. science and technology that has to do with airplanes or space.",
      gift: 42,
      messages: 6,
      chat: 'Okay goodnight. Great catching up'),
  UserModel(
      name: 'Steve',
      image: 'assets/images/p3.png',
      date: '22/10/21',
      topic: 'Space',
      topics: ['Space Science', 'JWT', 'Universs'],
      content:
          "The National Aeronautics and Space Administration is an independent agency of the US federal government responsible for the civil space program, aeronautics research, and space research. Image result for nasa National Aeronautics and Space Administration NASA stands for National Aeronautics and Space Administration. NASA was started on October 1, 1958, as a part of the United States government. NASA is in charge of U.S. science and technology that has to do with airplanes or space.",
      gift: 14,
      messages: 2,
      chat: 'Lol 😂🤣'),
  UserModel(
      name: 'Stacy',
      image: 'assets/images/p4.png',
      date: '22/10/21',
      topic: 'People',
      topics: ['Nature', 'People', 'Environment'],
      content:
          "The National Aeronautics and Space Administration is an independent agency of the US federal government responsible for the civil space program, aeronautics research, and space research. Image result for nasa National Aeronautics and Space Administration NASA stands for National Aeronautics and Space Administration. NASA was started on October 1, 1958, as a part of the United States government. NASA is in charge of U.S. science and technology that has to do with airplanes or space.",
      gift: 18,
      messages: 6,
      chat: 'Yah I know right'),
];

List<TopicModel> topics = [
  TopicModel(name: 'Universe', duration: 40),
  TopicModel(name: 'Andromeda Galaxy', duration: 80),
  TopicModel(name: 'JWST', duration: 20),
];

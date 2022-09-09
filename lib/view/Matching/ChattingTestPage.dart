import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_counseling_center/model/match.dart';

class ChattingTestPage extends StatefulWidget {
  const ChattingTestPage({Key? key}) : super(key: key);

  @override
  State<ChattingTestPage> createState() => _ChattingTestPageState();
}

class _ChattingTestPageState extends State<ChattingTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('create chat data'),
          onPressed: () {
            createData();
          },
        ),
      ),
    );
  }

  void createData() {
    final matchCol = FirebaseFirestore.instance.collection("Chat").doc("chat1");
    matchCol.set({
      "matchingID": "match1",
      "messagesID": "1",
      "ownerNickname": "eun",
      "otherNickname": "meng",
      "messageList": {
        "message": "hello",
        "t": DateTime.now(),
        "nickname": "stone"
      },
    });
  }
}

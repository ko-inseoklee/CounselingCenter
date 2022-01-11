import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextBox inputBox = new TextBox(isBlank: false, hintText: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('채팅'),),
      body: Column(
        children: [
          Container(),
          Container(
            child: inputBox,
          )
        ],
      ),
    );
  }
}

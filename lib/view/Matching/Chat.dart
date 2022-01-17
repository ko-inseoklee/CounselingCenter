import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_counseling_center/model/chat/chat.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextBox inputBox = new TextBox(isBlank: false, hintText: '');

  Chat chat = new Chat(matchingID: '1234', messagesID: '12345', ownerNickname: 'inseoking', otherNickname: 'someng2',messages: {});
  Messages messages = new Messages(messagesID: '12345', messages: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('채팅'),),
      body: Column(
        children: [
          Container(
            height: 450,
            child: Column(
              children: _buildChatBubbleLists(messages),
            )
          ),
          Container(
            width: 600,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 350, height: 100, alignment: Alignment.center,child: inputBox),
                Container(
                  width: 50,
                  height: 100,
                  alignment: Alignment.center,
                  child: IconButton(onPressed: (){
                    Message t = new Message(nickname: chat.ownerNickname, t: DateTime.now(), message: inputBox.getText());

                    setState(() {
                      messages.messages.add(t);
                    });

                    inputBox.clear();
                  },
                    icon: Icon(Icons.arrow_forward),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildChatBubbleLists(Messages messages){
    return messages.messages.map((Message message) => _buildChatBubble(message)).toList();
  }

  Widget _buildChatBubble(Message message){
    return Container(
      width: 300,
      height: 80,
      child: ListTile(title: Text(message.message), leading: Text(message.nickname), trailing: Text("${message.t.hour.toString()}:${message.t.minute.toString()}"),),
    );
  }
}

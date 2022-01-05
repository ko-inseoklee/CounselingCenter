import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/model/user.dart';
import 'package:online_counseling_center/model/chatter.dart';
import 'package:online_counseling_center/view/HomePage.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  List<bool> selected = <bool>[false, false, false];
  // final List<String> user = <String>['소망', '인석', '성은', '예찬', '지열', '지웅'];

  User user_me = User(
      age: '20대',
      nickName: '소맹',
      uID: 'uid_0',
      ID: 'someng',
      password: '1234',
      sex: false);

  User user1 = User(
      age: '30대',
      nickName: 'inseoking',
      uID: 'uid_1',
      ID: 'inseoklee',
      password: '1234',
      sex: true);

  User user2 = User(
      age: '40대',
      nickName: 'kin9son',
      uID: 'uid_2',
      ID: 'seong_eun',
      password: '1234',
      sex: false);

  late List<User> users = [user_me, user1, user2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('매칭방')),
      body: Column(children: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding: EdgeInsets.fromLTRB(15, 10, 15, 5),
          children: [
            SizedBox(
              width: 110,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('주제', style: TextStyle(fontSize: 17)),
              ),
            ),
            SizedBox(
              width: 75,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('성별', style: TextStyle(fontSize: 17)),
              ),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            SizedBox(
              width: 110,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                onPressed: () {},
                child: Text(
                  '새 매칭방',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.black38,
          indent: 20,
          endIndent: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                height: 120,
                child: InkWell(
                  child: Card(
                      elevation: 4,
                      shape: selected[index]
                          ? new RoundedRectangleBorder(
                              side: new BorderSide(
                                  color: Colors.orange, width: 2.0),
                              borderRadius: BorderRadius.circular(4.0))
                          : new RoundedRectangleBorder(
                              side: new BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(4.0)),
                      child: Column(children: [
                        ListTile(
                          leading: Icon(Icons.chat_outlined),
                          title: Text('주제: '),
                          subtitle: Text(
                              '${users[index].nickName} / ${users[index].age} '),
                        )
                      ])),
                  onTap: () {
                    setState(() {
                      for (int i = 0; i <= 2; i++) {
                        if (i != index) selected[i] = false;
                      }
                      selected[index] = true;
                    });
                  },
                ),
              );
            },
            itemCount: users.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonHeight: 40,
          children: [
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    selected = [false, false, false];
                  });
                },
                child: Text('선택 취소',
                    style: TextStyle(color: Colors.black54, fontSize: 15))),
            SizedBox(
              width: 230,
              // height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {},
                child: Text('매칭방 입장',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        )
      ]),
    );
  }
}

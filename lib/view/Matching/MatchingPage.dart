import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/user.dart';
import 'package:online_counseling_center/model/matching.dart';
import 'package:online_counseling_center/view/HomePage.dart';
import 'package:get/get.dart';
// import 'package:online_counseling_center/view/Matching/NewMatching.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  List<bool> selected = <bool>[false, false, false];
  // final List<String> user = <String>['소망', '인석', '성은', '예찬', '지열', '지웅'];

  // Chat chat1 = Chat.init();
  matching chat1 = matching(
      topic: '세대 차이',
      title: '할아버지와의 세대 차이.. 도와주세요!',
      chatId: '0',
      chatterId: user_me.uID,
      partnerId: user1.uID,
      ageLimit: ['50대', '60대', '70대'],
      sexLimit: ['남', '여']);

  matching chat2 = matching(
      topic: '우정',
      title: '친구랑 다퉜는데 화해하고 싶어요ㅜ',
      chatId: '0',
      chatterId: user_me.uID,
      partnerId: user2.uID,
      ageLimit: ['10대', '20대', '30대', '50대', '60대', '70대', '40대'],
      sexLimit: ['남']);

  late List<matching> users = [chat1, chat2, chat1];

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
                child: Text('주제',
                    style: TextStyle(fontSize: 17, color: Colors.lightGreen)),
              ),
            ),
            SizedBox(
              width: 75,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('성별',
                    style: TextStyle(fontSize: 17, color: Colors.lightGreen)),
              ),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            SizedBox(
              width: 110,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                onPressed: () {
                  Get.toNamed('/newMatching');
                },
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
                height: 130,
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
                          title: Text('<${users[index].title}>',
                              style: TextStyle(fontSize: 15)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('#${users[index].topic} '),
                                  getSexLimit(index),
                                ],
                              ),
                              getAgeLimit(index),
                              Row(
                                children: [
                                  // Text(
                                  //   // '${users[index].nickName_} / ${users[index].age_} / ${users[index].sex_}',
                                  //   style:
                                  //       TextStyle(fontWeight: FontWeight.bold),
                                  // ),
                                  Icon(
                                    Icons.star,
                                    size: 17,
                                  )
                                ],
                              ),
                              // for (int i = 0; i < users[index].ID.length; i++)
                              //   Text(
                              //       '${users[index].nickName[i]} / ${users[index].age[i]} / ${users[index].sex[i]}'),
                            ],
                          ),
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
                onPressed: () {
                  setState(() {
                    // for (int i = 0; i < 3; i++) {
                    //   if (selected[i]) {
                    //     if (i == 0) {
                    //       chat1.nickName.add('웅지');
                    //       chat1.age.add('30대');
                    //       chat1.ID.add('woongzy');
                    //       chat1.uID.add('0');
                    //       chat1.sex.add('남');
                    //     } else if (i == 1) {
                    //       chat2.nickName.add('웅지');
                    //       chat2.age.add('30대');
                    //       chat2.ID.add('woongzy');
                    //       chat2.uID.add('0');
                    //       chat2.sex.add('남');
                    //     }
                    //   }
                    // }
                  });
                },
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

  Widget getSexLimit(int index) {
    if (users[index].sexLimit.contains('남') &&
        !users[index].sexLimit.contains('여')) {
      return Text('#남자만');
    } else if (users[index].sexLimit.contains('남') &&
        !users[index].sexLimit.contains('여'))
      return Text('#여자만');
    else
      return Text('');
  }

  Widget getAgeLimit(int index) {
    users[index].ageLimit.sort();

    if (users[index].ageLimit.length < 7) {
      return Row(children: [
        for (int i = 0; i < users[index].ageLimit.length; i++)
          Text(
            '#${users[index].ageLimit[i]} ',
            // softWrap: true,
          )
      ]);
    } else
      return Text('#모든 연령');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/model/user/user.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/match.dart';
import 'package:online_counseling_center/view/HomePage.dart';
import 'package:get/get.dart';
// import 'package:online_counseling_center/view/Matching/NewMatching.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/controller/MatchController.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  List<bool> selected = <bool>[false, false, false];

  late List<Match> matching_rooms = [match1, match2, match3];

  String _selectedTopic = '주제';
  final List<String> topicList = ['주제', '세대 차이', '우정', '취업/진로'];

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
              child: DropdownButton(
                value: _selectedTopic,
                items: topicList.map((value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    // _selectedTopic = value;
                  });
                },
                // child: Text('주제',
                //     style: TextStyle(fontSize: 17, color: Colors.lightGreen)),
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
              MatchController matchcontroller =
                  MatchController(match: matching_rooms[index]);
              Match match = matching_rooms[index];
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
                          title: Text('<${matching_rooms[index].title}>',
                              style: TextStyle(fontSize: 15)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('#${matching_rooms[index].topic} '),
                                  getSexLimit(index),
                                ],
                              ),
                              getAgeLimit(index),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.account_circle),
                                  Text(
                                    '  ${matchcontroller.getNickname(match: match)} / ${matchcontroller.getAge(match: match)} / ${matchcontroller.getSex(match: match)}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
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
            itemCount: matching_rooms.length,
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
    if (matching_rooms[index].sexLimit.contains('남') &&
        !matching_rooms[index].sexLimit.contains('여')) {
      return Text('#남자만');
    } else if (matching_rooms[index].sexLimit.contains('남') &&
        !matching_rooms[index].sexLimit.contains('여'))
      return Text('#여자만');
    else
      return Text('');
  }

  Widget getAgeLimit(int index) {
    matching_rooms[index].ageLimit.sort();

    if (matching_rooms[index].ageLimit.length < 7) {
      return Row(children: [
        for (int i = 0; i < matching_rooms[index].ageLimit.length; i++)
          Text(
            '#${matching_rooms[index].ageLimit[i]} ',
            // softWrap: true,
          )
      ]);
    } else
      return Text('#모든 연령');
  }
}

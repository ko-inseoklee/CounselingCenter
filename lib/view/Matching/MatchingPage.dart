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

List<bool> selected = <bool>[false, false, false];


class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {

  late List<Match> matchingRooms;


  String _selectedTopic = '주제';
  final List<String> topicList = ['주제', '세대 차이', '우정', '취업/진로'];

  String _selectedSex = '성별';
  final List<String> sexList = ['성별', '남자', '여자'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchingRooms = matching_rooms;
  }

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
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton(
                    underline: Container(),
                    // icon: Container(),
                    value: _selectedTopic,
                    items: topicList.map((value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightGreen)));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedTopic = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 75,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton(
                    underline: Container(),
                    // icon: Container(),
                    value: _selectedSex,
                    items: sexList.map((value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightGreen)));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = value.toString();
                      });
                    },
                  ),
                ),
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
          color: Colors.black,
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

              if ((match.partnerId == '') &&
                  (_selectedTopic == '주제' || match.topic == _selectedTopic) &&
                  (_selectedSex == '성별' ||
                      match.sexLimit.contains(_selectedSex)))
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
                                    Text(
                                      '#${matching_rooms[index].topic} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ])),
                    onTap: () {
                      setState(() {
                        for (int i = 0; i <= matching_rooms.length; i++) {
                          if (i != index) selected[i] = false;
                        }
                        selected[index] = true;
                      });
                    },
                  ),
                );
              else
                return Container();
            },
            itemCount: matching_rooms.length,
            separatorBuilder: (context, index) {
              return Container();
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
                  for (int i = 0; i < matching_rooms.length; i++) {
                    Match _match = matching_rooms[i];
                    if (selected[i]) {
                      if (_match.chatterId == user_me.uID) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('중복 참여'),
                                content: Text('내가 만든 방에는 참여할 수 없어요!'),
                                actions: [
                                  TextButton(
                                      child: Text('확인'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ],
                              );
                            });
                      } else {
                        setState(() {
                          if (i == 0) {
                            match1.partnerId = user_me.uID;
                          } else if (i == 1) {
                            match2.partnerId = user_me.uID;
                          } else if (i == 2) {
                            match3.partnerId = user_me.uID;
                          }
                        });
                      }
                    }
                  }
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
    if (matching_rooms[index].sexLimit.contains('남자') &&
        !matching_rooms[index].sexLimit.contains('여자')) {
      return Text('#남자만');
    } else if (matching_rooms[index].sexLimit.contains('남자') &&
        !matching_rooms[index].sexLimit.contains('여자'))
      return Text('#여자만');
    else
      return Text('#남녀모두');
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/model/user/user.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/match.dart';
import 'package:online_counseling_center/view/MainPage.dart';
import 'package:get/get.dart';
// import 'package:online_counseling_center/view/Matching/NewMatching.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/controller/MatchController.dart';

List<bool> selected = <bool>[true, false, false];

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  late List<Match> matchingRooms;

  String _selectedTopic = '주제';
  final List<String> topicList = ['주제', '세대 차이', '우정', '취업/진로'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchingRooms = matching_rooms;
  }

  SnackBar snackbar_age = SnackBar(
    content: Text('content'),
    duration: Duration(days: 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 15.h),
        Container(
          width: 288.w,
          height: 33.h,
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.sp),
                      color: selected[0] ? SecondaryDColor : Color(0xffE0E0E0)),
                  width: 90.w,
                  height: 33.h,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selected[0] = true;
                          selected[1] = false;
                          selected[2] = false;
                        });
                      },
                      child: Text(
                        '전체보기',
                        style: TextStyle(
                            color: selected[0]
                                ? Color(0xffffffff)
                                : Color(0xff939393),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ))),
              SizedBox(width: 9.w),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.sp),
                      color: selected[1] ? SecondaryDColor : Color(0xffE0E0E0)),
                  width: 90.w,
                  height: 33.h,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selected[1] = true;
                          selected[0] = false;
                          selected[2] = false;

                          showPopup('세대');

                        });
                      },
                      child: Text(
                        '세대별',
                        style: TextStyle(
                            color: selected[1]
                                ? Color(0xffffffff)
                                : Color(0xff939393),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ))),
              SizedBox(width: 9.w),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.sp),
                      color: selected[2] ? SecondaryDColor : Color(0xffE0E0E0)),
                  width: 90.w,
                  height: 33.h,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selected[2] = true;
                          selected[0] = false;
                          selected[1] = false;
                        });
                      },
                      child: Text(
                        '주제별',
                        style: TextStyle(
                            color: selected[2]
                                ? Color(0xffffffff)
                                : Color(0xff939393),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )))
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 22.h),
            // height: 22.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(
                      left: 16.w,
                    ),
                    child: Text('전체 매칭방',
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700))),
                SizedBox(width: 137.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        // width: 13.5.w,
                        // height: 13.5.h,
                        // color: Colors.black,
                        // constraints: BoxConstraints(maxWidth: 13.5.w),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Image.asset(
                            'image/checkIcon_before.png',
                            width: 13.5.w,
                            height: 13.5.h,
                          ),
                          onPressed: () {
                            // TODO
                          },
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 4.5.w),
                      child: Text('참여가능만 보기',
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                )
              ],
            )),
        Container(
          width: 288.w,
          padding: EdgeInsets.only(top: 5.h),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              MatchController matchcontroller =
                  MatchController(match: matching_rooms[index]);
              Match match = matching_rooms[index];
              return Container(
                  width: 288.w,
                  padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                  decoration: BoxDecoration(
                      color: (index % 2 == 1)
                          ? SecondaryDColor.withOpacity(0.75)
                          : SecondaryLColor.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(24.sp)),
                  child: Container(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 238.w,
                              child: Text(
                                match.title,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Container(
                            height: 22.h,
                            child: Row(
                              children: [
                                Container(
                                    width: 40.w,
                                    height: 22.h,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(21.sp)),
                                    alignment: Alignment.center,
                                    child: Text('#${match.ageLimit[0]}',
                                        style: TextStyle(
                                            color: Color(0xff0098D1),
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w500))),
                                SizedBox(width: 5.w),
                                Container(
                                    width: 40.w,
                                    height: 22.h,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(21.sp)),
                                    alignment: Alignment.center,
                                    child: Text('#${match.ageLimit[1]}',
                                        style: TextStyle(
                                            color: Color(0xff0098D1),
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w500))),
                                SizedBox(width: 5.w),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 8.w, right: 8.w),
                                    height: 22.h,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(21.sp)),
                                    alignment: Alignment.center,
                                    child: Text('#주제_${match.topic}',
                                        style: TextStyle(
                                            color: Color(0xff0098D1),
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w500))),
                              ],
                            )),
                        SizedBox(height: 3.h),
                        Container(
                            child: Row(children: [
                          Text(
                            '${matchcontroller.getNickname(match: match)} / ${matchcontroller.getAge(match: match)} / ${matchcontroller.getSex(match: match)}',
                            style: TextStyle(
                                fontSize: 9.sp, fontWeight: FontWeight.w500),
                          )
                        ]))
                      ],
                    ),
                  ));
            },
            itemCount: matching_rooms.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 11.h);
            },
          ),
        ),
        // ButtonBar(
        //   alignment: MainAxisAlignment.spaceAround,
        //   buttonPadding: EdgeInsets.fromLTRB(15, 10, 15, 5),
        //   children: [
        //     SizedBox(
        //       width: 110,
        //       child: DecoratedBox(
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.grey, width: 1),
        //             borderRadius: BorderRadius.circular(10)),
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 10, right: 10),
        //           child: DropdownButton(
        //             underline: Container(),
        //             // icon: Container(),
        //             value: _selectedTopic,
        //             items: topicList.map((value) {
        //               return DropdownMenuItem(
        //                   value: value,
        //                   child: Text(value,
        //                       style: TextStyle(
        //                           fontSize: 16, color: Colors.lightGreen)));
        //             }).toList(),
        //             onChanged: (value) {
        //               setState(() {
        //                 _selectedTopic = value.toString();
        //               });
        //             },
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 75,
        //       child: DecoratedBox(
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.grey, width: 1),
        //             borderRadius: BorderRadius.circular(10)),
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 10, right: 10),
        //           child: DropdownButton(
        //             underline: Container(),
        //             // icon: Container(),
        //             value: _selectedSex,
        //             items: sexList.map((value) {
        //               return DropdownMenuItem(
        //                   value: value,
        //                   child: Text(value,
        //                       style: TextStyle(
        //                           fontSize: 16, color: Colors.lightGreen)));
        //             }).toList(),
        //             onChanged: (value) {
        //               setState(() {
        //                 _selectedSex = value.toString();
        //               });
        //             },
        //           ),
        //         ),
        //       ),
        //     ),
        //     // SizedBox(
        //     //   width: 5,
        //     // ),
        //     SizedBox(
        //       width: 110,
        //       child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
        //         onPressed: () {
        //           Get.toNamed('/newMatching');
        //         },
        //         child: Text(
        //           '새 매칭방',
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // Divider(
        //   color: Colors.black,
        //   indent: 20,
        //   endIndent: 20,
        // ),
        // Container(
        //   height: MediaQuery.of(context).size.height * 0.65,
        //   child: ListView.separated(
        //     itemBuilder: (context, index) {
        //       MatchController matchcontroller =
        //           MatchController(match: matching_rooms[index]);
        //       Match match = matching_rooms[index];
        //
        //       if ((match.partnerId == '') &&
        //           (_selectedTopic == '주제' || match.topic == _selectedTopic) &&
        //           (_selectedSex == '성별' ||
        //               match.sexLimit.contains(_selectedSex)))
        //         return Container(
        //           padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        //           height: 130,
        //           child: InkWell(
        //             child: Card(
        //                 elevation: 4,
        //                 shape: selected[index]
        //                     ? new RoundedRectangleBorder(
        //                         side: new BorderSide(
        //                             color: Colors.orange, width: 2.0),
        //                         borderRadius: BorderRadius.circular(4.0))
        //                     : new RoundedRectangleBorder(
        //                         side: new BorderSide(
        //                             color: Colors.white, width: 2.0),
        //                         borderRadius: BorderRadius.circular(4.0)),
        //                 child: Column(children: [
        //                   ListTile(
        //                     leading: Icon(Icons.chat_outlined),
        //                     title: Text('<${matching_rooms[index].title}>',
        //                         style: TextStyle(fontSize: 15)),
        //                     subtitle: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Row(
        //                           children: [
        //                             Text(
        //                               '#${matching_rooms[index].topic} ',
        //                               style: TextStyle(
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                             getSexLimit(index),
        //                           ],
        //                         ),
        //                         getAgeLimit(index),
        //                         SizedBox(height: 5),
        //                         Row(
        //                           children: [
        //                             Icon(Icons.account_circle),
        //                             Text(
        //                               '  ${matchcontroller.getNickname(match: match)} / ${matchcontroller.getAge(match: match)} / ${matchcontroller.getSex(match: match)}',
        //                               style: TextStyle(
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   )
        //                 ])),
        //             onTap: () {
        //               setState(() {
        //                 for (int i = 0; i <= matching_rooms.length; i++) {
        //                   if (i != index) selected[i] = false;
        //                 }
        //                 selected[index] = true;
        //               });
        //             },
        //           ),
        //         );
        //       else
        //         return Container();
        //     },
        //     itemCount: matching_rooms.length,
        //     separatorBuilder: (context, index) {
        //       return Container();
        //     },
        //   ),
        // ),
        // ButtonBar(
        //   alignment: MainAxisAlignment.spaceAround,
        //   buttonHeight: 40,
        //   children: [
        //     OutlinedButton(
        //         onPressed: () {
        //           setState(() {
        //             selected = [false, false, false];
        //           });
        //         },
        //         child: Text('선택 취소',
        //             style: TextStyle(color: Colors.black54, fontSize: 15))),
        //     SizedBox(
        //       width: 230,
        //       // height: 40,
        //       child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(primary: Colors.orange),
        //         onPressed: () {
        //           for (int i = 0; i < matching_rooms.length; i++) {
        //             Match _match = matching_rooms[i];
        //             if (selected[i]) {
        //               if (_match.chatterId == user_me.uID) {
        //                 showDialog(
        //                     context: context,
        //                     builder: (BuildContext context) {
        //                       return AlertDialog(
        //                         title: Text('중복 참여'),
        //                         content: Text('내가 만든 방에는 참여할 수 없어요!'),
        //                         actions: [
        //                           TextButton(
        //                               child: Text('확인'),
        //                               onPressed: () {
        //                                 Navigator.of(context).pop();
        //                               })
        //                         ],
        //                       );
        //                     });
        //               } else {
        //                 setState(() {
        //                   if (i == 0) {
        //                     match1.partnerId = user_me.uID;
        //                   } else if (i == 1) {
        //                     match2.partnerId = user_me.uID;
        //                   } else if (i == 2) {
        //                     match3.partnerId = user_me.uID;
        //                   }
        //                 });
        //               }
        //             }
        //           }
        //         },
        //         child: Text('매칭방 입장',
        //             style:
        //                 TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        //       ),
        //     )
        //   ],
        // )
      ]),
    );
  }

  showPopup(String category) {
    bool isAgeCategory = (category == '세대');
    List<bool> isSelected = [true, false, false, false, false, false];

    showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: isAgeCategory ? 307.h : 490.h,
          color: Color(0xffffffff),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 11.h, right: 15.w, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 24.w,
                      height: 24.h,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // return '10대';
                            Get.back();
                          },
                          icon: ImageIcon(
                            AssetImage('image/closeIcon.png'),
                            color: TextBodyColor,
                          )),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 17.w, top: 10.h),
                  child: Row(
                    children: [
                      Text('$category 선택',
                          style: TextStyle(
                              color: TextBodyColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700)),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(top: 19.h, left: 16.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 90.w,
                              height: 78.h,
                              decoration: BoxDecoration(
                                  color: (isSelected[0]
                                      ? PrimaryColor
                                      : PrimaryColor.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(24.sp)),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top:6.h),
                                      child: Image.asset('image/image_3.png', fit: BoxFit.contain),
                                      width: 30.w,
                                      height: 44.h),
                                  SizedBox(height: 1.h),
                                  Text('10대',
                                      style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13.sp))
                                ],
                              )),
                          SizedBox(width: 9.w),
                          Container(
                            width: 90.w,
                            height: 78.h,
                            decoration: BoxDecoration(
                                color: (isSelected[1]
                                    ? PrimaryColor
                                    : PrimaryColor.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(24.sp)),
                          ),
                          SizedBox(width: 9.w),
                          Container(
                            width: 90.w,
                            height: 78.h,
                            decoration: BoxDecoration(
                                color: (isSelected[2]
                                    ? PrimaryColor
                                    : PrimaryColor.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(24.sp)),
                          )
                        ],
                      ),
                      Row()
                    ],
                  ))
            ],
          ),
        );
      },
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

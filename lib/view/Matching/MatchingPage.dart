import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/model/user/user.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/match.dart';
import 'package:online_counseling_center/view/MainPage.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/controller/MatchController.dart';
import 'package:online_counseling_center/view/Board/GenerationBoard.dart';
import 'package:online_counseling_center/view/Matching/NewMatchingBottomSheet.dart';
import 'package:online_counseling_center/view/customWidget/GenerationCards.dart';
import 'package:online_counseling_center/view/customWidget/StatefulBottomSheet.dart';

List<bool> categorySelected = <bool>[true, false, false];

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  late List<Match> matchingRooms;

  List<bool> topicSelected = List.filled(18, false);
  List<bool> generationSelected = List.filled(6, false);
  late String tabName;
  List<Match> newMatchingRooms = matching_rooms;
  late int listLength;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchingRooms = matching_rooms;
    tabName = '전체';
  }

  @override
  Widget build(BuildContext context) {
    listLength = newMatchingRooms.length;
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
                      color: categorySelected[0]
                          ? SecondaryDColor
                          : Color(0xffE0E0E0)),
                  width: 90.w,
                  height: 33.h,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          newMatchingRooms = matchingRooms;

                          categorySelected[0] = true;
                          categorySelected[1] = false;
                          categorySelected[2] = false;
                        });
                      },
                      child: Text(
                        '전체보기',
                        style: TextStyle(
                            color: categorySelected[0]
                                ? Color(0xffffffff)
                                : Color(0xff939393),
                            fontSize: 12.sp,
                            fontWeight: categorySelected[0]
                                ? FontWeight.w500
                                : FontWeight.w400),
                      ))),
              SizedBox(width: 9.w),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.sp),
                      color: categorySelected[1]
                          ? SecondaryDColor
                          : Color(0xffE0E0E0)),
                  width: 90.w,
                  height: 33.h,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (!categorySelected[1]) tabName = '세대별';

                          categorySelected[1] = true;
                          categorySelected[0] = false;
                          categorySelected[2] = false;

                          showPopup('세대', 307.h);
                        });
                      },
                      child: Text(
                        categorySelected[1]
                            ? ((tabName == '세대별') ? '세대별' : '$tabName 매칭방')
                            : '세대별',
                        style: TextStyle(
                            color: categorySelected[1]
                                ? Color(0xffffffff)
                                : Color(0xff939393),
                            fontSize: 12.sp,
                            fontWeight: categorySelected[1]
                                ? FontWeight.w500
                                : FontWeight.w400),
                      ))),
              SizedBox(width: 9.w),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.sp),
                      color: categorySelected[2]
                          ? SecondaryDColor
                          : Color(0xffE0E0E0)),
                  width: 90.w,
                  height: 33.h,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (!categorySelected[2]) tabName = '주제별';

                          categorySelected[2] = true;
                          categorySelected[0] = false;
                          categorySelected[1] = false;

                          showPopup('주제', 490.h);
                        });
                      },
                      child: Text(
                        categorySelected[2] ? tabName : '주제별',
                        style: TextStyle(
                            color: categorySelected[2]
                                ? Color(0xffffffff)
                                : Color(0xff939393),
                            fontSize: 12.sp,
                            fontWeight: categorySelected[2]
                                ? FontWeight.w500
                                : FontWeight.w400),
                      )))
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 22.h),
            // height: 22.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Row(
                      children: [
                        Text(categorySelected[0] ? '전체' : tabName,
                            style: TextStyle(
                                color: (categorySelected[0])
                                    ? Color(0xff333333)
                                    : SecondaryDColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700)),
                        Text(' 매칭방',
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700)),
                      ],
                    )),
                // SizedBox(width: 114.w),
                Container(
                  padding: EdgeInsets.only(right: 27.w),
                  child: Row(
                    children: [
                      Container(
                          child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Image.asset(
                          'image/checkIcon_before.png',
                          width: 13.5.w,
                          height: 13.5,
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
                  ),
                )
              ],
            )),
        Expanded(
          child: Container(
            width: 288.w,
            padding: EdgeInsets.only(top: 5.h),
            child: ListView.separated(
              // physics: const AlwaysScrollableScrollPhysics(), // new
              // controller: _controller,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                MatchController matchcontroller;
                Match match;

                // if (categorySelected[2]) {
                //   if (tabName != '주제별') {
                //     List<Match> filteredMatchingRooms = filterCategory(
                //         tabName: tabName);
                //     newMatchingRooms = filteredMatchingRooms;
                //   }
                //   else {
                //     newMatchingRooms = matching_rooms;
                //   }
                // } else {
                //   newMatchingRooms = matching_rooms;
                // }

                listLength = newMatchingRooms.length;
                matchcontroller =
                    MatchController(match: newMatchingRooms[index]);
                match = newMatchingRooms[index];

                return Container(
                    width: 288.w,
                    padding: EdgeInsets.only(top: 13, bottom: 13),
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
                            child: (match.ageLimit.length == 6)
                                ? Row(
                                    children: [
                                      Container(
                                          width: 55.w,
                                          height: 22.h,
                                          decoration: BoxDecoration(
                                              color: Color(0xffffffff),
                                              borderRadius:
                                                  BorderRadius.circular(21.sp)),
                                          alignment: Alignment.center,
                                          child: Text('#모든 연령',
                                              style: TextStyle(
                                                  color: Color(0xff0098D1),
                                                  fontSize: 9.sp,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      SizedBox(width: 5.w),
                                      Container(
                                          padding: EdgeInsets.only(
                                              left: 8.w, right: 8.w),
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
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < match.ageLimit.length;
                                          i++)
                                        Row(
                                          children: [
                                            Container(
                                                width: (match.ageLimit[i] == '60대 이상') ? 59.w : 40.w,
                                                height: 22.h,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffffffff),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            21.sp)),
                                                alignment: Alignment.center,
                                                child: Text(
                                                    '#${match.ageLimit[i]}',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff0098D1),
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.w500))),
                                            SizedBox(width: 5.w),
                                          ],
                                        ),
                                      Container(
                                          padding: EdgeInsets.only(
                                              left: 8.w, right: 8.w),
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
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ],
                                  ),
                          ),
                          if (match.ageLimit.length > 3 &&
                              match.ageLimit.length != 6)
                            Column(
                              children: [
                                SizedBox(height: 3.h),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 8.w, right: 8.w),
                                    width: 90.w,
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
                            ),
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
              itemCount: listLength,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 11.h);
              },
            ),
          ),
        ),
      ]),
      floatingActionButton: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0xffffffff).withOpacity(0.14),
              offset: Offset(4, 4),
              blurRadius: 10.sp)
        ]),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<String>(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.sp),
                  topRight: Radius.circular(24.sp),
                ),
              ),
              backgroundColor: Color(0xffffffff),
              context: context,
              builder: (BuildContext context) {
                return NewMatchingBottomSheet(addMatchingRoom: addMatchingRoom,
                );
              },
            );
          },
          backgroundColor: Color(0xffffffff),
          child: Image.asset('image/addMatchingIcon.png',
              width: 30.w, height: 30.h),
        ),
      ),
    );
  }

  addMatchingRoom(Match match) {
    matchingRooms.add(match);
  }

  changeTopic(int index) {
    setState(() {
      tabName = topicList[index];
    });
  }

  changeAge(int index) {
    setState(() {
      tabName = '${ageList[index]}';
    });
  }

  changeMatchingList(List<Match> matchingList) {
    setState(() {
      newMatchingRooms = matchingList;
    });
  }

  showPopup(String category, double height) {
    bool isAgeCategory = (category == '세대');
    List<bool> isSelected = [true, false, false, false, false, false];

    showModalBottomSheet<String>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.sp),
          topRight: Radius.circular(24.sp),
        ),
      ),
      backgroundColor: Color(0xffffffff),
      context: context,
      builder: (BuildContext context) {
        return StatefulBottomSheet(
          height: height,
          category: category,
          tabName: tabName,
          isAgeCategory: isAgeCategory,
          topicSelected: topicSelected,
          generationSelected: generationSelected,
          changedIndex: isAgeCategory ? changeAge : changeTopic,
          changeMatchingList: changeMatchingList,
        );
      },
    );
  }

  Widget getAgeLimit(int index) {
    newMatchingRooms[index].ageLimit.sort();

    if (newMatchingRooms[index].ageLimit.length < 7) {
      return Row(children: [
        for (int i = 0; i < newMatchingRooms[index].ageLimit.length; i++)
          Text(
            '#${newMatchingRooms[index].ageLimit[i]} ',
            // softWrap: true,
          )
      ]);
    } else
      return Text('#모든 연령');
  }

  filterCategory({required String tabName}) {
    List<Match> newMatchingRooms = [];

    for (int i = 0; i < matchingRooms.length; i++) {
      if (matchingRooms[i].topic == tabName)
        newMatchingRooms.add(matchingRooms[i]);
    }
    return newMatchingRooms;
  }
}

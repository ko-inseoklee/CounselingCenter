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
import 'package:online_counseling_center/view/Board/GenerationBoard.dart';
import 'package:online_counseling_center/view/customWidget/GenerationCards.dart';

List<bool> categorySelected = <bool>[true, false, false];

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  late List<Match> matchingRooms;

  // final List<String> topicList = [
  //   '세대차이',
  //   '만화/애니',
  //   '방송/연예',
  //   '문화/예술',
  //   '영화',
  //   '음악',
  //   '여행',
  //   '연애',
  //   '스포츠/레저',
  //   '반려동물',
  //   '취미',
  //   '패션/미용',
  //   '건강',
  //   '가족/육아',
  //   '교육',
  //   '게임',
  //   '일상생활',
  //   '기타'
  // ];

  List<bool> topicSelected = List.filled(18, false);
  late String tabName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchingRooms = matching_rooms;
    tabName = '전체';
  }

  // SnackBar snackbar_age = SnackBar(
  //   content: Text('content'),
  //   duration: Duration(days: 1),
  // );

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
                    color: categorySelected[0]
                        ? SecondaryDColor
                        : Color(0xffE0E0E0)),
                width: 90.w,
                height: 33.h,
                child: TextButton(
                    onPressed: () {
                      setState(() {
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
                          fontWeight: FontWeight.w500),
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
                        categorySelected[1] = true;
                        categorySelected[0] = false;
                        categorySelected[2] = false;

                        showPopup('세대', 307.h);
                      });
                    },
                    child: Text(
                      '세대별',
                      style: TextStyle(
                          color: categorySelected[1]
                              ? Color(0xffffffff)
                              : Color(0xff939393),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
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
                          fontWeight: FontWeight.w400),
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
                  padding: EdgeInsets.only(
                    left: 16.w,
                  ),
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
                  // mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Container(
                        // width: 13.5.w,
                        // height: 13.5.h,
                        // color: Colors.black,
                        // constraints: BoxConstraints(maxWidth: 13.5.w),
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
                ),
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
                                  fontSize: 14.sp, fontWeight: FontWeight.w700),
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
    ]));
  }

  changeTopic(int index) {
    setState(() {
      tabName = topicList[index];
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
            changedIndex: changeTopic);
        // return StatefulBuilder(
        //     builder: (BuildContext context, StateSetter setState) {
        //   return Container(
        //     height: height,
        //     // height: 490.h,
        //     child: Column(
        //       // mainAxisAlignment: MainAxisAlignment.center,
        //       // mainAxisSize: MainAxisSize.min,
        //       children: <Widget>[
        //         Container(
        //           padding: EdgeInsets.only(top: 11.h, right: 15.w),
        //           height: 35.h,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               Container(
        //                 width: 24.w,
        //                 height: 24.h,
        //                 child: IconButton(
        //                     padding: EdgeInsets.zero,
        //                     onPressed: () {
        //                       // return '10대';
        //                       Get.back();
        //                     },
        //                     icon: ImageIcon(
        //                       AssetImage('image/closeIcon.png'),
        //                       color: TextBodyColor,
        //                     )),
        //               )
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 10.h),
        //         Container(
        //             padding: EdgeInsets.only(left: isAgeCategory ? 17.w : 16.w),
        //             height: 22.h,
        //             child: Row(
        //               children: [
        //                 Text('$category선택',
        //                     style: TextStyle(
        //                         color: TextBodyColor,
        //                         fontSize: 14.sp,
        //                         fontWeight: FontWeight.w700)),
        //               ],
        //             )),
        //         SizedBox(height: isAgeCategory ? 19.h : 7.h),
        //         isAgeCategory
        //             ? Container(
        //                 width: 320.w,
        //                 height: 221.h,
        //                 padding: EdgeInsets.only(left: 16.w, right: 16.w),
        //                 child: GenerationCards(idx: 6, isWrap: true))
        //             : Container(
        //                 width: 320.w,
        //                 height: 416.h,
        //                 padding: EdgeInsets.only(
        //                     left: 17.w, right: 17.w, bottom: 68.h),
        //                 child: GridView.builder(
        //                     itemCount: 18,
        //                     gridDelegate:
        //                         SliverGridDelegateWithFixedCrossAxisCount(
        //                             crossAxisCount: 3,
        //                             crossAxisSpacing: 8.w,
        //                             mainAxisSpacing: 12.h,
        //                             mainAxisExtent: 48.h),
        //                     itemBuilder: (BuildContext context, int index) {
        //                       // children: List.generate(18, (index) {
        //                       return Container(
        //                         // width: 90.w,
        //                         decoration: BoxDecoration(
        //                             color: topicSelected[index]
        //                                 ? PrimaryColor
        //                                 : PrimaryColor.withOpacity(0.2),
        //                             borderRadius: BorderRadius.circular(16.sp)),
        //                         child: TextButton(
        //                           child: Text(
        //                             topicList[index],
        //                             style: TextStyle(
        //                                 color: topicSelected[index]
        //                                     ? TextPrimaryColor
        //                                     : Gray1Color,
        //                                 fontSize: 13.sp,
        //                                 fontWeight: FontWeight.w700),
        //                           ),
        //                           onPressed: () {
        //                             setState(() {
        //                               for (int i = 0; i < 18; i++) {
        //                                 if (i == index) {
        //                                   topicSelected[i] = true;
        //                                 } else
        //                                   topicSelected[i] = false;
        //                               }
        //                               tabName = topicList[index];
        //                             });
        //                           },
        //                         ),
        //                       );
        //                       // }),
        //                     }))
        //
        //       ],
        //     ),
        //   );
        // });
      },
    );
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

class StatefulBottomSheet extends StatefulWidget {
  final double height;
  String category;
  String tabName;
  final ValueChanged<int> changedIndex;
  final bool isAgeCategory;
  List<bool> topicSelected;
  StatefulBottomSheet({
    Key? key,
    required this.height,
    required this.category,
    required this.tabName,
    required this.isAgeCategory,
    required this.topicSelected,
    required this.changedIndex,
  }) : super(key: key);

  @override
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends State<StatefulBottomSheet> {
  @override
  Widget build(BuildContext context) {
    bool isAgeCategory = widget.isAgeCategory;
    String category = widget.category;
    List<bool> topicSelected = widget.topicSelected;

    return Container(
      height: widget.height,
      // height: 490.h,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 11.h, right: 15.w),
            height: 35.h,
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
          SizedBox(height: 10.h),
          Container(
              padding: EdgeInsets.only(left: isAgeCategory ? 17.w : 16.w),
              height: 22.h,
              child: Row(
                children: [
                  Text('$category선택',
                      style: TextStyle(
                          color: TextBodyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700)),
                ],
              )),
          SizedBox(height: isAgeCategory ? 19.h : 7.h),
          isAgeCategory
              ? Container(
                  width: 320.w,
                  height: 221.h,
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: GenerationCards(idx: 6, isWrap: true))
              : Container(
                  width: 320.w,
                  height: 416.h,
                  padding:
                      EdgeInsets.only(left: 17.w, right: 17.w, bottom: 68.h),
                  child: GridView.builder(
                      itemCount: 18,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 12.h,
                          mainAxisExtent: 48.h),
                      itemBuilder: (BuildContext context, int index) {
                        // children: List.generate(18, (index) {
                        return Container(
                          // width: 90.w,
                          decoration: BoxDecoration(
                              color: topicSelected[index]
                                  ? PrimaryColor
                                  : PrimaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.sp)),
                          child: TextButton(
                            child: Text(
                              topicList[index],
                              style: TextStyle(
                                  color: topicSelected[index]
                                      ? TextPrimaryColor
                                      : Gray1Color,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                for (int i = 0; i < 18; i++) {
                                  if (i == index) {
                                    topicSelected[i] = true;
                                  } else
                                    topicSelected[i] = false;
                                }
                                // tabName = topicList[index];
                                widget.changedIndex(index);
                              });
                            },
                          ),
                        );
                        // }),
                      }))
        ],
      ),
    );
  }
}

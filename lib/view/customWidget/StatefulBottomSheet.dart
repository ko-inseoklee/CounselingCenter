import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/view/customWidget/GenerationCards.dart';
import 'package:online_counseling_center/model/match.dart';

class StatefulBottomSheet extends StatefulWidget {
  final double height;
  String category;
  String tabName;
  final ValueChanged<int> changedIndex;
  final bool isAgeCategory;
  List<bool> topicSelected;
  List<bool> generationSelected;
  final ValueChanged<List<Match>> changeMatchingList;
  StatefulBottomSheet({
    Key? key,
    required this.height,
    required this.category,
    required this.tabName,
    required this.isAgeCategory,
    required this.topicSelected,
    required this.generationSelected,
    required this.changedIndex,
    required this.changeMatchingList,
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
    List<bool> generationSelected = widget.generationSelected;
    List<Match> newMatchingList = [];

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
                  child:
                      // GenerationCards(idx: 6, isGridview: true, generationSelected: generationSelected,)
                      GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 9.w,
                        mainAxisSpacing: 12.h
                        // childAspectRatio: 1,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return generationCard_match(index);
                    },
                  ))
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
                                widget.changedIndex(index);
                                newMatchingList =
                                    filterCategory(tabName: topicList[index]);
                                widget.changeMatchingList(newMatchingList);
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

  List<Widget> generationCards_match(int length) {
    return List<Widget>.generate(length, (index) => generationCard_match(index));
  }

  Widget generationCard_match(int idx) {
    List<bool> generationSelected = widget.generationSelected;
    // bool isGridview = widget.isGridview;
    List<Match> newMatchingList = [];

    return Container(
      width: 90.w,
      height: 78.h,
      margin: EdgeInsets.zero,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black, // Text Color
        ),
        onPressed: () {
          // print(idx);

          setState(() {
            for (int i = 0; i < 6; i++) {
              if (i == idx)
                generationSelected[i] = true;
              else
                generationSelected[i] = false;
            }
            widget.changedIndex(idx);
            newMatchingList =
                filterAge(age: ageList[idx]);
            widget.changeMatchingList(newMatchingList);
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ImageIcon(
                AssetImage("image/generations/${idx + 1}.png"),
                size: 50.sp,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(idx + 1) * 10}대',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: (!generationSelected[idx])
                            ? Gray1Color
                            : WhiteColor),
                  ),
                  if (idx == 5)
                    Text(
                      ' 이상',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: (!generationSelected[idx])
                              ? Gray1Color
                              : WhiteColor),
                    )
                ],
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: (!generationSelected[idx])
              ? PrimaryColor.withOpacity(0.3)
              : PrimaryColor,
          borderRadius: BorderRadius.circular(24.sp)),
    );
  }

  filterCategory({required String tabName}) {
    List<Match> newMatchingRooms = [];

    for (int i = 0; i < matching_rooms.length; i++) {
      if (matching_rooms[i].topic == tabName)
        newMatchingRooms.add(matching_rooms[i]);
    }
    return newMatchingRooms;
  }

  filterAge({required String age}) {
    List<Match> newMatchingRooms = [];

    for (int i = 0; i < matching_rooms.length; i++) {
      if (matching_rooms[i].ageLimit.contains(age))
        newMatchingRooms.add(matching_rooms[i]);
    }
    return newMatchingRooms;
  }
}

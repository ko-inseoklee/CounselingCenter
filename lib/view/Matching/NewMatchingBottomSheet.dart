import 'package:flutter/material.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/match.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMatchingBottomSheet extends StatefulWidget {
  ValueChanged<Match> addMatchingRoom;

  NewMatchingBottomSheet({Key? key, required this.addMatchingRoom})
      : super(key: key);

  @override
  _NewMatchingBottomSheetState createState() => _NewMatchingBottomSheetState();
}

class _NewMatchingBottomSheetState extends State<NewMatchingBottomSheet> {
  double height = 530.h;
  String? selectedTopic;

  final roomTitleController = TextEditingController();
  bool isFilled = false;
  List<bool> ageSelected = List.filled(6, false);
  List<String> ageLimit = [];

  @override
  Widget build(BuildContext context) {
    isFilled = ((roomTitleController.text != '') &&
        (selectedTopic != null) &&
        (ageSelected.any((element) => element == true)));

    return Container(
        height: height,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 134.w, top: 15.h),
                child: Row(children: [
                  Text('매칭하기',
                      style: TextStyle(
                          color: TextBodyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700)),
                  SizedBox(width: 95.w),
                  Container(
                      width: 24.w,
                      height: 24.h,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Image.asset('image/closeIcon.png'),
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ))
                ])),
            Container(
                height: 415.h,
                padding: EdgeInsets.only(top: 44.h, left: 22.w, right: 16.w),
                child: Column(
                  children: [
                    Container(
                      height: 48.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('주제',
                              style: TextStyle(
                                  color: TextBodyColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700)),
                          Container(
                              width: 214.w,
                              height: 48.h,
                              padding:
                                  EdgeInsets.only(left: 16.w, right: 14.5.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(16.sp),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xff000000).withOpacity(0.08),
                                        offset: Offset(4, 4),
                                        blurRadius: 20.sp)
                                  ]),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                value: selectedTopic,
                                // isExpanded: false,
                                // isDense: true,
                                icon: Container(
                                    // width: 10.5.w,
                                    // height: 10.5.h,
                                    padding: EdgeInsets.zero,
                                    child: Image.asset('image/Polygon_1.png',
                                        width: 10.5.w, height: 10.5.h)),
                                style: TextStyle(
                                    color: TextBodyColor,
                                    fontWeight: (selectedTopic == null)
                                        ? FontWeight.w500
                                        : FontWeight.w700,
                                    fontSize: (selectedTopic == null)
                                        ? 12.sp
                                        : 13.sp),
                                onChanged: (String? newTopic) {
                                  setState(() {
                                    selectedTopic = newTopic ?? "";
                                  });
                                },
                                items: topicList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: 48.h,
                                      child: Text(
                                        value,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                hint: Text('선택하기',
                                    style: TextStyle(
                                        color: Gray2Color,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700)),
                              )))
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                        height: 48.h,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('방제목',
                                  style: TextStyle(
                                      color: TextBodyColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700)),
                              Container(
                                  width: 214.w,
                                  height: 48.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff000000)
                                                .withOpacity(0.08),
                                            offset: Offset(4, 4),
                                            blurRadius: 20.sp)
                                      ]),
                                  child: TextField(
                                    style: TextStyle(
                                        color: TextBodyColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700),
                                    controller: roomTitleController,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '입력하기',
                                        hintStyle: TextStyle(
                                            color: Gray2Color,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w700)),
                                  ))
                            ])),
                    SizedBox(height: 30.h),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text('참여가능 연령대',
                            style: TextStyle(
                                color: TextBodyColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700))),
                    SizedBox(height: 16.h),
                    Container(
                        width: 320.w,
                        height: 192.h,
                        padding: EdgeInsets.only(left: 1.w),
                        child: GridView.builder(
                            itemCount: 6,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.w,
                                    mainAxisSpacing: 11.h,
                                    mainAxisExtent: 48.h),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                      color: ageSelected[index]
                                          ? SecondaryLColor
                                          : Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff000000)
                                                .withOpacity(0.08),
                                            offset: Offset(4, 4),
                                            blurRadius: 20.sp)
                                      ]),
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        ageSelected[index] =
                                            !ageSelected[index];
                                      });
                                    },
                                    child: Text(
                                      ageList[index],
                                      style: TextStyle(
                                          color: ageSelected[index]
                                              ? WhiteColor
                                              : Gray2Color,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ));
                            }))
                  ],
                )),
            Container(
                width: 288.w,
                height: 48.h,
                decoration: BoxDecoration(
                    color: isFilled ? SecondaryLColor : Color(0xffDDDDDD),
                    borderRadius: BorderRadius.circular(24.sp)),
                child: TextButton(
                  child: Text(
                    '매칭방 만들기',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: WhiteColor,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    // print('selected topic = [$selectedTopic]');

                    ageLimit = makeAgeLimitList(ageSelected);
                    // print(ageLimit);

                    Match newMatchingRoom = Match(
                        topic: selectedTopic!,
                        title: roomTitleController.text,
                        chatId: '0',
                        chatterId: user1.uID,
                        partnerId: '',
                        ageLimit: ageLimit);

                    widget.addMatchingRoom(newMatchingRoom);
                    Get.back();

                  },
                ))
          ],
        ));
  }

  makeAgeLimitList(List<bool> ageSelected) {
    List<String> ageLimit = [];
    for (int i = 0; i < ageSelected.length; i++) {
      if (ageSelected[i]) ageLimit.add(ageList[i]);
    }
    return ageLimit;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/color.dart';

import 'package:online_counseling_center/view/Board/BoardPage.dart';
import 'package:online_counseling_center/view/Matching/MatchingPage.dart';
import 'package:online_counseling_center/view/Board/MessagePage.dart';
import 'package:online_counseling_center/view/MainPage.dart';
import 'package:online_counseling_center/view/Tip/TipPage.dart';

import 'package:online_counseling_center/view/HomePage.dart';
import 'package:online_counseling_center/view/customWidget/DefaultAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool editPressed = false;
  bool anySelected = false;

  late List<Widget> menuList = [
    HomePage(),
    BoardPage(),
    MatchingPage(
      editPressed: toggleBottomSheet,
      anySelected: checkAnySelected,
    ),
    MessagePage(),
    TipPage()
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      // isMain = ((index == 0) ? true : false);
    });
  }

  toggleBottomSheet(bool value) {
    setState(() {
      editPressed = value;
    });
  }

  checkAnySelected(bool value) {
    setState(() {
      anySelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    DefaultAppBar _defaultAppBar = DefaultAppBar(
      pageIndex: _currentIndex,
    );
    return Scaffold(
      appBar: _defaultAppBar,
      drawerEnableOpenDragGesture: false,

      // TODO: textbutton onPressed -> 페이지 연결
      endDrawer: SizedBox(
        width: 203.w,
        child: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 89.h,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                    ),
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.only(top: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Image.asset(
                                  'image/settingIcon.png',
                                  width: 14.88.w,
                                  color: WhiteColor,
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              SizedBox(width: 2.83.w),
                              TextButton(
                                child: Image.asset(
                                  'image/closeIcon.png',
                                  width: 17.w,
                                  color: WhiteColor,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 11.w,
                            top: 20.42.h,
                          ),
                          child: Row(
                            children: [
                              Container(
                                  width: 30.sp,
                                  height: 30.sp,
                                  // decoration: BoxDecoration(
                                  //   shape: BoxShape.circle,
                                  // ),
                                  child:
                                      Image.asset('image/defaultProfile.png')),
                              SizedBox(width: 6.w),
                              TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '로그인 해주세요',
                                      style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 1.w),
                                    Image.asset(
                                      'image/navigateNextIcon.png',
                                      color: WhiteColor,
                                      width: 20.w,
                                      height: 20.h,
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20.w, top: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '핫한 게시글',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: TextBodyColor),
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      )),
                      Container(
                          padding: EdgeInsets.only(top: 16.h),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '오늘의 주제',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: TextBodyColor),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 16.h),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '세대별 매칭방',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: TextBodyColor),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 16.h),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '세대별 꿀팁',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: TextBodyColor),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 16.h),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '세대별 투표',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: TextBodyColor),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 16.h),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '고객센터',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff969696)),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 5.h),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '공지사항',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff969696)),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          )),
                      SizedBox(height: 166.h),
                      Container(
                        width: 161.38.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Color(0xffDDDDDD),
                          borderRadius: BorderRadius.circular(390.sp),
                        ),
                        child: TextButton(
                          child: Text(
                            '로그아웃',
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                                color: WhiteColor),
                          ),
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      )
                    ]
                    // },
                    // ],
                    ),
              ),
            ],
          ),
        ),
      ),
      body: menuList[_currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xffaaaaaa).withOpacity(0.25),
            offset: Offset(0, -4.sp),
            blurRadius: 10,
          )
        ]),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(28.sp),
            ),
            child: !editPressed
                ? BottomNavigationBar(
                    // elevation: 10,
                    backgroundColor: Color(0xffffffff),
                    type: BottomNavigationBarType.fixed,
                    onTap: _onTap,
                    selectedItemColor: PrimaryColor,
                    currentIndex: _currentIndex,
                    selectedLabelStyle:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700),
                    // selectedIconTheme: IconThemeData(color: PrimaryColor),
                    // unselectedIconTheme: IconThemeData(color: TextBodyColor),
                    items: [
                      BottomNavigationBarItem(
                          label: '홈',
                          icon: Container(
                            margin: EdgeInsets.only(top: 3.h),
                            width: 21.w,
                            height: 21.h,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Image.asset(
                              "image/homeIcon.png",
                              fit: BoxFit.contain,
                              color: (_currentIndex == 0)
                                  ? PrimaryColor
                                  : Color(0xff333333),
                              // fit: BoxFit.fitHeight
                            ),
                          )),
                      BottomNavigationBarItem(
                          label: '게시판',
                          icon: Container(
                            margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                            width: 18.w,
                            height: 18.h,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Image.asset(
                              "image/boardIcon.png",
                              fit: BoxFit.contain,
                              color: (_currentIndex == 1)
                                  ? PrimaryColor
                                  : Color(0xff333333),
                              // fit: BoxFit.fitHeight
                            ),
                          )),
                      BottomNavigationBarItem(
                          label: '매칭하기',
                          icon: Container(
                            margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                            width: 18.w,
                            height: 18.h,
                            // decoration: BoxDecoration(color: Colors.yellow),
                            child: Image.asset(
                              "image/matchIcon.png",
                              fit: BoxFit.contain,

                              color: (_currentIndex == 2)
                                  ? PrimaryColor
                                  : Color(0xff333333),
                              // fit: BoxFit.fitHeight
                            ),
                          )),
                      BottomNavigationBarItem(
                        label: '쪽지함',
                        icon: Container(
                          margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                          width: 18.w,
                          height: 18.h,
                          // decoration: BoxDecoration(color: Colors.yellow),
                          child: Image.asset(
                            "image/messageIcon.png",
                            fit: BoxFit.contain,
                            color: (_currentIndex == 3)
                                ? PrimaryColor
                                : Color(0xff333333),
                            // fit: BoxFit.fitHeight
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: '꿀팁',
                        icon: Container(
                          margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                          width: 18.w,
                          height: 18.h,
                          // decoration: BoxDecoration(color: Colors.yellow),
                          child: Image.asset(
                            "image/tipIcon.png",
                            fit: BoxFit.contain,
                            color: (_currentIndex == 4)
                                ? PrimaryColor
                                : Color(0xff333333),
                            // fit: BoxFit.fitHeight
                          ),
                        ),
                      ),
                    ],
                  )
                : BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    items: [
                        BottomNavigationBarItem(
                            label: '',
                            icon: Container(
                                width: 138.w,
                                height: 48,
                                decoration: BoxDecoration(
                                    color:
                                        anySelected ? PrimaryColor : Gray2Color,
                                    borderRadius: BorderRadius.circular(24.sp)),
                                child: TextButton(
                                  child: Text(
                                    '모두 읽기',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: WhiteColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () {
                                    // TODO: 모두읽기
                                  },
                                  style: ButtonStyle(
                                    // minimumSize: Size.zero,
                                    // padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.sp),
                                      // side: BorderSide(color: Colors.red)
                                    )),
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => anySelected
                                                ? PrimaryVariant3Color
                                                : Gray2Color),
                                  ),
                                ))),
                        BottomNavigationBarItem(
                            label: '매칭하기',
                            icon: Container(
                                width: 138.w,
                                height: 48,
                                decoration: BoxDecoration(
                                    color:
                                        anySelected ? PrimaryColor : Gray2Color,
                                    borderRadius: BorderRadius.circular(24.sp)),
                                child: TextButton(
                                  child: Text(
                                    '매칭방 나가기',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: WhiteColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () {
                                    if (anySelected) {
                                      Get.dialog(Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24.sp))),
                                        backgroundColor: Color(0xffffffff),
                                        child: Container(
                                            width: 240.w,
                                            height: 138.h,
                                            child: Column(children: [
                                              SizedBox(height: 38.h),
                                              Text('이 매칭방을 나가시겠습니까?',
                                                  style: TextStyle(
                                                      color: Color(0xff000000),
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              SizedBox(height: 1.h),
                                              Text('매칭방을 나가면 복구할 수 없습니다.',
                                                  style: TextStyle(
                                                      color: AlertRedColor,
                                                      fontSize: 9.sp,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              SizedBox(height: 18.h),
                                              Container(
                                                  width: 204.w,
                                                  height: 34.h,
                                                  child: Row(children: [
                                                    Container(
                                                        width: 95.w,
                                                        height: 34.h,
                                                        decoration: BoxDecoration(
                                                            color: Gray3Color,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.sp)),
                                                        child: TextButton(
                                                          child: Text('취소',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: ButtonStyle(
                                                              overlayColor: MaterialStateColor
                                                                  .resolveWith(
                                                                      (states) =>
                                                                          GrayButtonDown),
                                                              shape: MaterialStateProperty.all<
                                                                      RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.sp),
                                                                // side: BorderSide(color: Colors.red)
                                                              ))),
                                                        )),
                                                    SizedBox(width: 14.w),
                                                    Container(
                                                        width: 95.w,
                                                        height: 34.h,
                                                        decoration: BoxDecoration(
                                                            color: PrimaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.sp)),
                                                        child: TextButton(
                                                          child: Text(
                                                            '나가기',
                                                            style: TextStyle(
                                                                color:
                                                                    WhiteColor,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          onPressed: () {},
                                                          style: ButtonStyle(
                                                              overlayColor: MaterialStateColor
                                                                  .resolveWith(
                                                                      (states) =>
                                                                          PrimaryVariant3Color),
                                                              shape: MaterialStateProperty.all<
                                                                      RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.sp),
                                                                // side: BorderSide(color: Colors.red)
                                                              ))),
                                                        ))
                                                  ]))
                                            ])),
                                      ));
                                    }
                                  },
                                  style: ButtonStyle(
                                    // minimumSize: Size.zero,
                                    // padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.sp),
                                      // side: BorderSide(color: Colors.red)
                                    )),
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => anySelected
                                                ? PrimaryVariant3Color
                                                : Gray2Color),
                                  ),
                                ))),
                      ])),
      ),
      // ),
    );
  }
}

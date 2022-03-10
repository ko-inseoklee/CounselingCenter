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
  final List<Widget> menuList = [
    HomePage(),
    BoardPage(),
    MatchingPage(),
    MessagePage(),
    TipPage()
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      // isMain = ((index == 0) ? true : false);
    });
  }

  @override
  Widget build(BuildContext context) {
    DefaultAppBar _defaultAppBar = DefaultAppBar(
      pageIndex: _currentIndex,
    );
    return Scaffold(
      appBar: _defaultAppBar,
      body: menuList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
                decoration: BoxDecoration(
                  // color: Colors.yellow,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     "image/homeIcon.png",
                  //     // color:
                  //     // (_currentIndex == 0) ? PrimaryColor : Color(0xff333333),
                  //   ),
                  // ),
                ),
                width: 24.w,
                height: 24.h,
                child: Image.asset(
                  "image/homeIcon.png",
                  color:
                      (_currentIndex == 0) ? PrimaryColor : Color(0xff333333),
                ),
              )),
          BottomNavigationBarItem(
              label: '게시판',
              icon: Container(
                // decoration: BoxDecoration(color: Colors.yellow),
                width: 24.w,
                height: 24.h,
                // margin: EdgeInsets.zero,
                // padding: EdgeInsets.zero,
                child: Image.asset(
                  "image/boardIcon.png",
                  width: 24.w,
                  height: 24.h,
                  color:
                      (_currentIndex == 1) ? PrimaryColor : Color(0xff333333),
                  // fit: BoxFit.fitHeight
                ),
              )),
          BottomNavigationBarItem(
              label: '매칭하기',
              icon: Container(
                width: 24.w,
                height: 24.h,
                // decoration: BoxDecoration(color: Colors.yellow),
                child: ImageIcon(
                  AssetImage("image/matchIcon.png"),
                  color:
                      (_currentIndex == 2) ? PrimaryColor : Color(0xff333333),
                ),
              )),
          BottomNavigationBarItem(
              label: '쪽지함',
              icon: Column(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.h,
                    // decoration: BoxDecoration(color: Colors.yellow),
                    padding: EdgeInsets.only(
                        left: 2.w, right: 2.w, top: 2.h, bottom: 2.h),
                    child: ImageIcon(
                      AssetImage("image/messageIcon.png"),
                      // size: 20.sp,
                      color: (_currentIndex == 3)
                          ? PrimaryColor
                          : Color(0xff333333),
                    ),
                  ),
                  // SizedBox(height: 3.h),
                ],
              )),
          BottomNavigationBarItem(
            label: '꿀팁',
            icon: Container(
              width: 24.w,
              height: 24.h,
              // decoration: BoxDecoration(color: Colors.yellow),
              child: ImageIcon(
                AssetImage("image/tipIcon.png"),
                color: (_currentIndex == 4) ? PrimaryColor : Color(0xff333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

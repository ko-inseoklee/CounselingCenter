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
                margin: EdgeInsets.only(top: 3.h),
                width: 21.w,
                height: 21.h,
                decoration: BoxDecoration(color: Colors.yellow),
                child:Image.asset(
                  "image/homeIcon.png",
                  fit: BoxFit.contain,
                  color:
                  (_currentIndex == 1) ? PrimaryColor : Color(0xff333333),
                  // fit: BoxFit.fitHeight
                ),
              )
              ),
          BottomNavigationBarItem(
              label: '게시판',
              icon: Container(
                margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(color: Colors.yellow),
                child:Image.asset(
                  "image/boardIcon.png",
                  fit: BoxFit.contain,
                  color:
                  (_currentIndex == 1) ? PrimaryColor : Color(0xff333333),
                  // fit: BoxFit.fitHeight
                ),
              )
              ),
          BottomNavigationBarItem(
              label: '매칭하기',
              icon: Container(
                margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(color: Colors.yellow),
                child:Image.asset(
                  "image/matchIcon.png",
                  fit: BoxFit.contain,
                  color:
                  (_currentIndex == 1) ? PrimaryColor : Color(0xff333333),
                  // fit: BoxFit.fitHeight
                ),
              )
          ),
          BottomNavigationBarItem(
              label: '쪽지함',
              icon: Container(
                margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(color: Colors.yellow),
                child:Image.asset(
                  "image/messageIcon.png",
                  fit: BoxFit.contain,
                  color:
                  (_currentIndex == 1) ? PrimaryColor : Color(0xff333333),
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
              decoration: BoxDecoration(color: Colors.yellow),
              child:Image.asset(
                "image/tipIcon.png",
                fit: BoxFit.contain,
                color:
                (_currentIndex == 1) ? PrimaryColor : Color(0xff333333),
                // fit: BoxFit.fitHeight
              ),
            ),
          ),
        ],
      ),
    );
  }
}

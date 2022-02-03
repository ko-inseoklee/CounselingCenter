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
  // bool isMain = true;
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
    DefaultAppBar _defaultAppBar = DefaultAppBar(pageIndex: _currentIndex,);

    print('someng logged in!\n');
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(320, 568),
    //     // context: context,
    //     // minTextAdapt: true,
    //     orientation: Orientation.portrait);
    // ScreenUtil().setWidth(320);
    // ScreenUtil().setHeight(568);
    // ScreenUtil().setSp(11);
    return Scaffold(
      appBar: _defaultAppBar,

      body: menuList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        selectedItemColor: PrimaryColor,
        currentIndex: _currentIndex,
        selectedFontSize: 11.sp,
        unselectedFontSize: 11.sp,
        items: [
          BottomNavigationBarItem(
              label: '홈',
              icon: Container(
                width: 16.w,
                height: 18.h,
                child: ImageIcon(
                  AssetImage("image/homeIcon.png"),
                  // size: ScreenUtil().setSp(24),
                  color: (_currentIndex == 0) ? PrimaryColor : Color(0xff333333),
                ),
              )),
          BottomNavigationBarItem(
              label: '게시판',
              icon: Container(
                width: 16.89.w,
                height: 19.84.h,
                child: ImageIcon(
                  AssetImage("image/boardIcon.png"),
                  // size: ScreenUtil().setSp(19.84),
                  color: (_currentIndex == 1) ? PrimaryColor : Color(0xff333333),
                ),
              )),
          BottomNavigationBarItem(
              label: '매칭하기',
              icon: Container(
                width: 19.98.w,
                height: 17.65.h,
                child: ImageIcon(
                  AssetImage("image/matchIcon.png"),
                  // size: 17.65.sp,
                  color: (_currentIndex == 2) ? PrimaryColor : Color(0xff333333),
                ),
              )),
          BottomNavigationBarItem(
              label: '쪽지함',
              icon: Container(
                width: 20.w,
                height: 20.h,
                child: ImageIcon(
                  AssetImage("image/messageIcon.png"),
                  // size: 20.sp,
                  color: (_currentIndex == 3) ? PrimaryColor : Color(0xff333333),
                ),
              )),
          BottomNavigationBarItem(
            label: '꿀팁',
            icon: Container(
              width: 16.27.w,
              height: 19.h,
              child: ImageIcon(
                AssetImage("image/tipIcon.png"),
                // size: 19.sp,
                color: (_currentIndex == 4) ? PrimaryColor : Color(0xff333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

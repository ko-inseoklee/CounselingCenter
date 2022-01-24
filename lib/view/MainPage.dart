import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/color.dart';

import 'package:online_counseling_center/view/Board/BoardPage.dart';
import 'package:online_counseling_center/view/Matching/MatchingPage.dart';
import 'package:online_counseling_center/view/Board/MessagePage.dart';
import 'package:online_counseling_center/view/MainPage.dart';
import 'package:online_counseling_center/view/Tip/TipPage.dart';

import 'package:online_counseling_center/view/HomePage.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    print('someng logged in!\n');
    return Scaffold(
      appBar: AppBar(
        title: Text('메인'),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       Text('넉넉'),
      //       TextButton(
      //           onPressed: () {
      //             Get.toNamed('/sign-up');
      //           },
      //           child: Text('회원가입 페이지')),
      //       TextButton(
      //           onPressed: () {
      //             Get.toNamed('/matching');
      //           },
      //           child: Text('매칭 페이지')),
      //       TextButton(
      //           onPressed: () {
      //             Get.toNamed('/chat');
      //           },
      //           child: Text('채팅 페이지')),
      //       TextButton(
      //           onPressed: () {
      //             Get.toNamed('/board');
      //           },
      //           child: Text('소통 게시판 페이지'))
      //     ],
      //   ),
      // ),
      body: menuList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        selectedItemColor: MainYellow,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: '게시판',
            icon: ImageIcon(AssetImage("image/boardIcon.png"), color: (_currentIndex == 1) ? MainYellow : Color(0xff333333),)
          ),
          BottomNavigationBarItem(
            label: '매칭하기',
            icon: ImageIcon(AssetImage("image/matchIcon.png"), color: (_currentIndex == 2) ? MainYellow : Color(0xff333333),)
          ),
          BottomNavigationBarItem(
            label: '쪽지함',
            icon: ImageIcon(AssetImage("image/messageIcon.png"), color: (_currentIndex == 3) ? MainYellow : Color(0xff333333),)
          ),
          BottomNavigationBarItem(
            label: '꿀팁',
            icon: Icon(Icons.lightbulb_outline),
          ),
        ],
      ),
    );
  }
}

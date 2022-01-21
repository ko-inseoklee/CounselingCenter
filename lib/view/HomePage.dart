import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // int _currentIndex = 0;
  // final List<Widget> _children = [Home(), First(), Second()];
  //
  // void _onTap(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    print('someng logged in!\n');
    return Scaffold(
      appBar: AppBar(
        title: Text('메인'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('넉넉'),
            TextButton(
                onPressed: () {
                  Get.toNamed('/sign-up');
                },
                child: Text('회원가입 페이지')),
            TextButton(
                onPressed: () {
                  Get.toNamed('/matching');
                },
                child: Text('매칭 페이지')),
            TextButton(
                onPressed: () {
                  Get.toNamed('/chat');
                },
                child: Text('채팅 페이지')),
            TextButton(
                onPressed: () {
                  Get.toNamed('/board');
                },
                child: Text('소통 게시판 페이지'))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MainYellow,
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: '게시판',
            icon: Icon(Icons.sticky_note_2_outlined),
          ),
          BottomNavigationBarItem(
            label: '매칭하기',
            icon: Icon(Icons.person_add_outlined),
          ),
          BottomNavigationBarItem(
            label: '쪽지함',
            icon: Icon(Icons.chat_outlined),
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

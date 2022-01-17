import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/model/user/user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
                  Get.toNamed('/matching');
                },
                child: Text('매칭 페이지')),
            TextButton(
                onPressed: () {
                  Get.toNamed('/sign-up');
                },
                child: Text('회원가입 페이지')),
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
    );
  }
}

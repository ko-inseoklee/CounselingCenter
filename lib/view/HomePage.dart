import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/model/user/user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // User user_me = User(
  //     age: '20대',
  //     nickName: '소맹',
  //     uID: 'uid_0',
  //     ID: 'someng',
  //     password: '1234',
  //     sex: false);
  //
  // User user1 = User(
  //     age: '30대',
  //     nickName: 'inseoking',
  //     uID: 'uid_1',
  //     ID: 'inseoklee',
  //     password: '1234',
  //     sex: true);
  //
  // User user2 = User(
  //     age: '40대',
  //     nickName: 'kin9son',
  //     uID: 'uid_2',
  //     ID: 'seong_eun',
  //     password: '1234',
  //     sex: false);

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
            Text('급식들과 주전부리'),
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
                child: Text('채팅 페이지'))
          ],
        ),
      ),
    );
  }
}

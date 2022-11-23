import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/dummy/testHotBoardData.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/view/Login/SignUp.dart';
import 'package:online_counseling_center/view/Profile/EditProfilePage.dart';
import 'package:online_counseling_center/view/customWidget/DefaultAppBar.dart';
import 'package:online_counseling_center/view/customWidget/MatchingListCards.dart';
import 'package:online_counseling_center/view/customWidget/SwipeCards.dart';
import 'package:online_counseling_center/view/customWidget/BestTipCards.dart';
import 'package:online_counseling_center/dummy/testTodayTopicData.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/view/Login/LoginPage.dart';
import 'MainComponents/KKCardWidget.dart';
import 'package:online_counseling_center/view/SignUp/SignUpNamePage.dart';

import 'Matching/ChattingTestPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            child: TextButton(
          child: Text('회원가입 페이지 ㄲ'),
          onPressed: () {
            Get.to(SignUpNamePage());
          },
        )),
        Container(
            child: TextButton(
              child: Text('로그인 페이지 ㄲ'),
              onPressed: () {
                Get.to(LoginPage());
              },
            )),
        Container(
            child: TextButton(
              child: Text('Firebase test page'),
              onPressed: () {
                Get.to(ChattingTestPage());
              },
            )),
        TextButton(
          child: Text('프로필 - 계정 page'),
          onPressed: () {
            Get.to(EditProfilePage());
          },
        ),
        SizedBox(height: 14),
        KKCardWidget(
          title: 'Today Topic',
          width: 288.w,
          height: 221.h,
          isTodayTopic: true,
          hotPosts: hotboards,
          topics: topicData,
        ),
        KKCardWidget(
            width: 288.w,
            height: 231.h,
            title: '핫한 게시글',
            isTodayTopic: false,
            topics: topicData,
            hotPosts: hotboards),
        MatchingListCards(
          width: 288.w,
          height: 170.h,
          title: '현재 매칭 가능방',
          matchList: matching_rooms,
        ),
        BestTipCards(title: 'Best 꿀팁')
      ]),
    );
  }
}

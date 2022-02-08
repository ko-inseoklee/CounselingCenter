import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/dummy/testHotBoardData.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/view/customWidget/MatchingListCards.dart';
import 'package:online_counseling_center/view/customWidget/SwipeCards.dart';
import 'package:online_counseling_center/view/customWidget/BestTipCards.dart';
import 'package:online_counseling_center/dummy/testTodayTopicData.dart';

import 'MainComponents/KKCardWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(320, 568),
        // context: context,
        // minTextAdapt: true,
        orientation: Orientation.portrait);
    ScreenUtil().setSp(11);
    return ListView(children: [
      // SwipingCards(),
      SizedBox(height: 14.h),
      KKCardWidget(
        title: 'Today Toipic',
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
    ]);
  }
}

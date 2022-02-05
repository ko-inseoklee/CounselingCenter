import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/dummy/testHotBoardData.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/view/customWidget/MatchingListCards.dart';
import 'package:online_counseling_center/view/customWidget/SwipeCards.dart';

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
      Padding(
        padding: EdgeInsets.only(left: 16.w, top: 14.h),
        child: Row(
          children: [
            Text(
              'Today Topic',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage("image/navigateNextIcon.png")),
              color: Color(0xff333333),
            )
          ],
        ),
      ),
      SwipingCards(),
      KKCardWidget(
        width: 288.w,
        height: 231.h,
        title: '핫한 게시글',
        hotPosts: hotboards,
      ),
      MatchingListCards(
        width: 288.w,
        height: 220.h,
        title: '현재 매칭 가능방',
        matchList: matching_rooms,
      ),
    ]);
  }
}

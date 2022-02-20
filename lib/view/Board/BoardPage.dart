import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/dummy/testBoardData.dart';
import 'package:online_counseling_center/model/board/comment.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';
import 'package:online_counseling_center/view/Board/GenerationBoard.dart';
import 'package:online_counseling_center/view/Board/TodayTopicWithAnswer.dart';
import 'package:online_counseling_center/view/customWidget/PostWidget.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  TodayTopic todayTopic = TodayTopic(date: '2022.01.18', question: "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?", writerID: 'admin', likes: 0, comments: [new Comment(bID: 'admin', cID: '1', contents: "저는 일찍 잘래", writerID: "inseoking", writtenTime: "18:45", re: [], like: 16, title: '내 어린시절 우연히')]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('소통 게시판')),
        body: ListView(
          children: [
            Row(
              children: [
                Container(width: 100.w,),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 0),
              // width: 288.w,
              height: 138.w,
              child: GenerationBoard(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.w, 17.h, 16.w, 0),
              width: 288.w,
              height: 446.w,
              child: TodayTopicWithAnswer(topic: todayTopic,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.w, 15.h, 16.w, 0),
              width: 288.w,
              height: 327.w,
              child: HotPost(),
            ),

          ],
        ));
  }

  Widget HotPost(){
    return Column(
      children: [
        Container(
          height: 23.h,
          margin: EdgeInsets.only(bottom: 10.h),
          child: Row(
            children: [
              Text("핫한 게시글 ",style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),),
              Icon(Icons.arrow_forward_ios_outlined,size: 14.sp,)
            ],
          ),
        ),
        HotPostWidget(backgroundColor: SecondaryLColor, board: board1, rank: 1),
        HotPostWidget(backgroundColor: SecondaryDColor, board: board2, rank: 2),
        HotPostWidget(backgroundColor: SecondaryLColor, board: board3, rank: 3),
      ],
    );
  }
}

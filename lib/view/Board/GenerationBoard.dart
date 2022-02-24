import 'package:flutter/material.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/view/customWidget/GenerationCards.dart';
import 'package:online_counseling_center/model/match.dart';

import '../../color.dart';

class GenerationBoard extends StatefulWidget {
  const GenerationBoard({Key? key}) : super(key: key);

  @override
  _GenerationBoardState createState() => _GenerationBoardState();
}

class _GenerationBoardState extends State<GenerationBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 23,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text(
                  "세대별 게시판",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14.sp,
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil.defaultSize.width,
            height: 78.h,
            // child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: generationCards(6),
            // ),
            child: GenerationCards(
              idx: 6,
              isGridview: false,
              generationSelected: [],
              // changedIndex: printAge,
              // changeMatchingList: printAgeMatchingList,
            ),
          ),
        ],
      ),
    );
  }

  printAge(int index) {
    print(index);
  }

  printAgeMatchingList(List<Match> matchingList) {
    print(matchingList[0]);
  }
}

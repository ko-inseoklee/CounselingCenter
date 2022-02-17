import 'package:flutter/material.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../color.dart';

class GenerationBoard extends StatelessWidget {

  const GenerationBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 23.h,
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
              children: [
                Text("세대별 게시판", style: TextStyle(color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),),
                Icon(Icons.arrow_forward_ios_outlined, size: 14.sp,)
              ],
            ),
          ),
          Container(
            width: ScreenUtil.defaultSize.width,
            height: 78.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: generationCards(6),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generationCards(int length){
    return List<Widget>.generate(length, (index) => generationCard(index));
  }

  Widget generationCard(int idx){
    return Container(
      width: 78.h,
      height: 78.h,
      margin: EdgeInsets.only(right: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ImageIcon(
                AssetImage("image/generations/${idx + 1}.png"),size: 50.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1.h),
            child: Text('${(idx+1) * 10}대',style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700),),
          )

        ],
      ),
      decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(35)
      ),
    );
  }
}

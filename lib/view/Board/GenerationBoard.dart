import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 130,
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
            height: 97,
            child:  ListView(
                scrollDirection: Axis.horizontal,
                children: generationCards(length: 6)),
          ),
        ],
      ),
    );
  }

  List<Widget> generationCards({required int length}){
    return List<Widget>.generate(length, (index) => generationCard(index));
  }

  Widget generationCard(int idx){
    return Container(
      width: 78.w,
      height: 97,
      margin: EdgeInsets.only(right: 12.w),
      child: TextButton(
        onPressed: (){
          print(idx);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30.w,
              height: 56,
              child: ImageIcon(
                AssetImage("image/generations/${idx + 1}.png"),size: 20.sp, color: Colors.black, semanticLabel: "10대",
              ),
            ),
            Container(
              height: 24,
              margin: EdgeInsets.only(top: 1),
              child: Text('${(idx+1) * 10}대',style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700),),
            )

          ],
        ),
      ),
      decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius: BorderRadius.circular(24)
      ),
    );
  }
}

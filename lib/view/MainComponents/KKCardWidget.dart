import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/model/board/board.dart';

import '../../color.dart';

class KKCardWidget extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  final List<Board> hotPosts;
  const KKCardWidget({Key? key,required this.title,required this.width,required this.height, required this.hotPosts}) : super(key: key);

  @override
  _KKCardWidgetState createState() => _KKCardWidgetState();
}

class _KKCardWidgetState extends State<KKCardWidget> {
  int currentPageIdx = 2;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initStatenavigateNextIcon
    super.initState();

    _pageController = new PageController(initialPage: currentPageIdx);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              children: [
                Text(
                  widget.title,
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
          Container(
            height: 158.h,
            child: PageView(
              controller: _pageController,
              children: buildCards(),
              onPageChanged: (int page){
                setState(() {
                  currentPageIdx = page;
                });

              },
            ),
          ),
          Center(
            child: Container(
              width: 22.w,
              padding: EdgeInsets.only(top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.fiber_manual_record_rounded,size: 3.3.sp, color: currentPageIdx == 0? SecondaryDColor : DisabledColor,),
                  Icon(Icons.fiber_manual_record_rounded,size: 3.3.sp, color: currentPageIdx == 1? SecondaryDColor : DisabledColor,),
                  Icon(Icons.fiber_manual_record_rounded,size: 3.3.sp, color: currentPageIdx == 2? SecondaryDColor : DisabledColor,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildCards(){
    return widget.hotPosts.map((e) => buildCard(e)).toList();
  }

  Widget buildCard(Board board){
    return Center(
      child: Container(
        width: 288.w,
        height: 158.h,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: widget.width),
              decoration: BoxDecoration(
                color: SecondaryLColor.withOpacity(0.75),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  image: DecorationImage(
                      image: AssetImage("image/hotCard.png"),
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                  )
              ),
              height: 49.h,
              padding: EdgeInsets.only(left: 14.w,top: 9.h),
              child: Text(board.writtenTime,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF))),
            ),
            Container(
              height: 76.h,
              decoration: BoxDecoration(
                color: SecondaryLColor.withOpacity(0.75),
              ),
            ),
            Container(
              height: 33.h,
              decoration: BoxDecoration(
                  color: SecondaryLColor,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
              ),
            )
          ],
        ),
      ),
    );
  }
}

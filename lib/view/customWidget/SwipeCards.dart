import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class SwipingCards extends StatefulWidget {
  const SwipingCards({Key? key}) : super(key: key);

  @override
  _SwipingCardsState createState() => _SwipingCardsState();
}

class _SwipingCardsState extends State<SwipingCards> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      buildPage("0", "2022.01.30", "그저께 질문", "Producer", 76, 70),
      buildPage("1", "2022.01.31", "어제 질문", "Producer", 40, 25),
      buildPage(
          "2", "2022.02.01", "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?", "Producer", 15, 10),
    ];

    return Container(
      alignment: Alignment.center,
      width: 288.w,
      height: 158.h,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              children: items,
              controller: _controller,
            ),
          ),
          ScrollingPageIndicator(
            dotColor: Color(0xffC4C4C4),
            dotSelectedColor: SecondaryLColor,
            dotSize: 3.33.sp,
            dotSelectedSize: 3.33.sp,
            dotSpacing: 6.w,
            controller: _controller,
            itemCount: items.length,
            orientation: Axis.horizontal,
          ),
        ],
      ),
    );
  }

  Widget buildPage(String text, String date, String question, String creator, int like, int comments) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
          color: PrimaryVariant1Color, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 14.w, top: 9.h),
            child: Text(date,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF))),
          ),
          Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 44.01.h),
                  child: IconButton(
                    onPressed: () {
                      _controller.previousPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    },
                    icon: ImageIcon(AssetImage("image/navigateBeforeIcon.png")),
                    color: Color(0xffffffff).withOpacity(0.6),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 26.h),
                  width: 205.w,
                  height: 45.h,
                  child: Text(
                    'Q. $question',
                    // text,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 44.01.h),
                  child: IconButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      icon: ImageIcon(
                        AssetImage("image/navigateNextIcon.png"),
                        color: Color(0xffffffff).withOpacity(0.6),
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25.sp),
            child: Row(
              children: [
                SizedBox(width: 29.w),
                Text('by $creator',
                    style: TextStyle(
                        color: TextPrimaryColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 135.77.sp),
                ImageIcon(AssetImage("image/likeIcon.png"),
                    color: TextPrimaryColor),
                Text('$like',
                    style: TextStyle(
                        color: TextPrimaryColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 13.w),
                ImageIcon(AssetImage("image/commentIcon.png"),
                    color: TextPrimaryColor),
                Text('$comments',
                    style: TextStyle(
                        color: TextPrimaryColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

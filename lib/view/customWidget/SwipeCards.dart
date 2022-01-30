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
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      buildPage("0", "2022.01.30", "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?"),
      buildPage("1", "2022.01.31", "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?"),
      buildPage("2", "2022.02.01", "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?"),
      // buildPage("3", Colors.amber),
      // buildPage("4", Colors.deepPurple),
      // buildPage("5", Colors.teal),
      // buildPage("6", Colors.pink),
      // buildPage("7", Colors.brown)
    ];

    return Container(
      width: 288.w,
      height: 158.h,
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.05)),
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

  Widget buildPage(String text, String date, String question) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
          color: PrimaryVariant1Color,
          borderRadius: BorderRadius.circular(24)),
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
            child: Container(
              margin: EdgeInsets.only(top: 26.h),
              width: 215.w,
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
          ),
        ],
      ),
    );
  }
}

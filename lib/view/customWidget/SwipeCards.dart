import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
// import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

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
    //TODO: items는 나중에 데이터로 불러올 것이기 때문에 따로 데이터를 만들어두고 call 해오는 방식으로 짜면 좋을 듯?(인석)
    List<Widget> items = [
      buildPage("0", "2022.01.30", "그저께 질문", "Producer", 76, 70),
      buildPage("1", "2022.01.31", "어제 질문", "Producer", 40, 25),
      buildPage("2", "2022.02.01", "학창시절로 다시 돌아간다면, 무엇을 가장 하고 싶어요?", "Producer",
          15, 10),
    ];

    return Container(
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black,
      //       // offset: Offset(0,2.h),
      //       blurRadius: 6.0,
      //       spreadRadius: 2.0
      //     )
      //   ]
      // ),
      width: 288.w,
      height: 158.h,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(left: 16.w),
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              children: items,
              controller: _controller,
            ),
          ),
          // ScrollingPageIndicator(
          //   dotColor: Color(0xffC4C4C4),
          //   dotSelectedColor: SecondaryLColor,
          //   dotSize: 3.33.sp,
          //   dotSelectedSize: 3.33.sp,
          //   dotSpacing: 6.w,
          //   controller: _controller,
          //   itemCount: items.length,
          //   orientation: Axis.horizontal,
          // ),
        ],
      ),
    );
  }

  Widget buildPage(String text, String date, String question, String creator,
      int like, int comments) {
    return Container(
      decoration: BoxDecoration(
          // color: PrimaryVariant1Color,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 288.w,
            height: 49.h,
            decoration: BoxDecoration(
                color: PrimaryVariant1Color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                image: DecorationImage(
                    image: AssetImage("image/topicCard.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft)),
            padding: EdgeInsets.only(left: 14.w, top: 9.h),
            child: Text(date,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF))),
          ),
          Container(
            color: PrimaryVariant1Color,
            height: 66.h,
            width: 288.w,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 35.w,
                  height: 45.h,
                  // padding: EdgeInsets.only(top: 44.01.h),
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
                Container(
                  alignment: Alignment.topCenter,
                  width: 35.w,
                  height: 45.h,
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
            width: 288.w,
            decoration: BoxDecoration(
                color: PrimaryVariant1Color.withOpacity(0.8),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text('by $creator',
                      style: TextStyle(
                          color: TextPrimaryColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500)),
                  width: 91.w,
                ),
                Container(
                  margin: EdgeInsets.only(right: 16.w),
                  child: Row(
                    children: [
                      ImageIcon(AssetImage("image/likeIcon.png"),
                          color: TextPrimaryColor),
                      Text('$like',
                          style: TextStyle(
                              color: TextPrimaryColor,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500)),
                      ImageIcon(AssetImage("image/commentIcon.png"),
                          color: TextPrimaryColor),
                      Text('$comments',
                          style: TextStyle(
                              color: TextPrimaryColor,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: 22.w,
              padding: EdgeInsets.only(top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 3.3.sp,
                    color: text == "0" ? SecondaryDColor : DisabledColor,
                  ),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 3.3.sp,
                    color: text == "1" ? SecondaryDColor : DisabledColor,
                  ),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 3.3.sp,
                    color: text == "2" ? SecondaryDColor : DisabledColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

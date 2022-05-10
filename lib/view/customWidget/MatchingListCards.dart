import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/model/match.dart';
import 'package:online_counseling_center/color.dart';

class MatchingListCards extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  final List<Match> matchList;
  const MatchingListCards(
      {Key? key,
      required this.title,
      required this.width,
      required this.height,
      required this.matchList})
      : super(key: key);

  @override
  _MatchingListCardsState createState() => _MatchingListCardsState();
}

class _MatchingListCardsState extends State<MatchingListCards> {
  int currentPageIdx = 0;
  late PageController _pageController;

  @override
  void initState() {
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
            child:
            // Row(
            //   children: [
            //     Text(
            //       widget.title,
            //       style:
            //           TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Color(0xff37352F)),
            //     ),
            //     IconButton(
            //       onPressed: () {},
            //       icon: ImageIcon(AssetImage("image/navigateNextIcon.png")),
            //       color: Color(0xff111111),
            //     )
            //   ],
            // ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff37352F)),
                  ),
                  ImageIcon(
                    AssetImage("image/navigateNextIcon.png"),
                    color: Color(0xff111111),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 97.h,
            child: PageView(
              controller: _pageController,
              children: buildCards(),
              onPageChanged: (int page) {
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
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 3.3.sp,
                    color:
                        currentPageIdx == 0 ? SecondaryDColor : DisabledColor,
                  ),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 3.3.sp,
                    color:
                        currentPageIdx == 1 ? SecondaryDColor : DisabledColor,
                  ),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 3.3.sp,
                    color:
                        currentPageIdx == 2 ? SecondaryDColor : DisabledColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildCards() {
    return widget.matchList.map((e) => buildCard(e)).toList();
  }

  Widget buildCard(Match match) {
    return Center(
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(24.sp),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffffffff).withOpacity(0.08),
                  offset: Offset(4.sp, 4.sp), //(x,y)
                  // spreadRadius: 20.sp,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 26.w,
                    padding: EdgeInsets.only(left: 8.0),
                    alignment: Alignment.centerLeft,
                    child: FlatButton(onPressed: (){
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    }, child: Icon(Icons.arrow_back_ios, color: Color(0xffD4D4D4)),)
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('10대',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Color(0xff37352F),
                                      fontWeight: FontWeight.w700)),
                              padding: EdgeInsets.only(right: 5.sp),
                            ),
                            // 1st topic
                            SizedBox(width: 4.w),
                            Container(
                              decoration: BoxDecoration(
                                  color: PrimaryVariantLColor,
                                  borderRadius: BorderRadius.circular(43.sp)),
                              width: 45.w,
                              height: 13.h,
                              child: Center(
                                child: Text('#${match.topic}',
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                            // 2nd topic
                            SizedBox(width: 4.w),
                            Container(
                              decoration: BoxDecoration(
                                  color: PrimaryVariantLColor,
                                  borderRadius: BorderRadius.circular(43)),
                              width: 45.w,
                              height: 13.h,
                              child: Center(
                                child: Text('#${match.topic}',
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 14.h, bottom: 12.h),
                          child: Center(
                              child: Text(
                            match.title,
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w500),
                          ))),
                      Container(
                          decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.circular(43.sp)),
                          width: 236.w,
                          height: 23.h,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '매칭하기',
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  width: 26.w,
                  padding: EdgeInsets.only(right: 8.0),
                  alignment: Alignment.centerLeft,
                  child: FlatButton(onPressed: (){
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  }, child: Icon(Icons.arrow_forward_ios, color: Color(0xffD4D4D4)),)
                ),
              ],
            )));
  }
}

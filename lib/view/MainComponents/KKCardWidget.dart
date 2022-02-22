import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/model/board/board.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';

import '../../color.dart';

class KKCardWidget extends StatefulWidget {
  final String title;
  final bool isTodayTopic;
  final double width;
  final double height;
  final List<Board> hotPosts;
  final List<TodayTopic> topics;
  const KKCardWidget(
      {Key? key,
      required this.title,
      required this.isTodayTopic,
      required this.width,
      required this.height,
      required this.hotPosts,
      required this.topics})
      : super(key: key);

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
            child:
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
            height: 158,
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
              padding: EdgeInsets.only(top: 2),
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
    var idx = 0;
    return widget.isTodayTopic ?  widget.topics.map((e) => buildCard1(e, ++idx)).toList():
      widget.hotPosts.map((e) => buildCard2(e, ++idx)).toList();
  }

  Widget buildCard1(TodayTopic topic, int idx) {
    return Center(
      child: Container(
        width: 288.w,
        height: 158,
        margin: EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff000000).withOpacity(0.08),
                  blurRadius: 20.sp,
                  offset: Offset(4.sp, 4.sp))
            ]
        ),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: widget.width),
              decoration: BoxDecoration(
                  color: widget.isTodayTopic
                      ? PrimaryVariant1Color
                      : SecondaryLColor.withOpacity(0.75),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  image: DecorationImage(
                    image: widget.isTodayTopic
                        ? AssetImage("image/Intersect_0.png")
                        : AssetImage("image/hotCard.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  )),
              height: 49,
              padding: EdgeInsets.only(left: 14.w, top: 9),
              child: Text(topic.date,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF))),
            ),
            Container(
              height: 76,
              decoration: BoxDecoration(
                color: widget.isTodayTopic
                    ? PrimaryVariant1Color
                    : SecondaryLColor.withOpacity(0.75),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 35.w,
                    height: 45,
                    child: IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      icon:
                      ImageIcon(AssetImage("image/navigateBeforeIcon.png")),
                      color: Color(0xffffffff).withOpacity(0.6),
                    ),
                  ),
                  Container(
                    width: 215.w,
                    height: 45,
                    child: Text(
                      'Q. ${topic.question}',
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
                    height: 45,
                    child: IconButton(
                        onPressed: () {
                          _pageController.nextPage(
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
            Divider(
              color: Color(0xffffffff).withOpacity(0.5),
              height: 0,
              thickness: 0.5.sp,
            ),
            Container(
              height: 27,
              decoration: BoxDecoration(
                color: widget.isTodayTopic
                    ? PrimaryVariant1Color.withOpacity(0.8)
                    : SecondaryLColor.withOpacity(0.75),
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('by ${topic.writerID}',
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF))),
                    padding: EdgeInsets.only(left: 29.w),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 29.w),
                    child: Row(
                      children: [
                        ImageIcon(AssetImage("image/likeIcon.png"),
                            color: TextPrimaryColor),
                        Text(topic.likes.toString(),
                            style: TextStyle(
                                color: TextPrimaryColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500)),
                        ImageIcon(AssetImage("image/commentIcon.png"),
                            color: TextPrimaryColor),
                        Text(topic.comments!.length.toString(),
                            style: TextStyle(
                                color: TextPrimaryColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard2(Board board, int idx) {
    return Center(
      child: Container(
        width: 288.w,
        height: 158,
        margin: EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff000000).withOpacity(0.08),
                  blurRadius: 20.sp,
                  offset: Offset(4.sp, 4.sp))
            ]
        ),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: widget.width),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: widget.isTodayTopic
                      ? PrimaryVariant1Color
                      : SecondaryLColor.withOpacity(0.75),
                  image: DecorationImage(
                    image: widget.isTodayTopic
                        ? AssetImage("image/Intersect_0.png")
                        : AssetImage("image/hotCard.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  )),
              height: 49,
              padding: EdgeInsets.only(left: 15.w, top: 12),
              child: Text("Best $idx",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF))),
            ),
            Container(
              height: 76,
              decoration: BoxDecoration(
                color: widget.isTodayTopic
                    ? PrimaryVariant1Color
                    : SecondaryLColor.withOpacity(0.75),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 35.w,
                    height: 45,
                    child: IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      icon:
                          ImageIcon(AssetImage("image/navigateBeforeIcon.png")),
                      color: Color(0xffffffff).withOpacity(0.6),
                    ),
                  ),
                  Container(
                    width: 215.w,
                    height: 45,
                    child: Text(
                      '${board.title}',
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
                    height: 45,
                    child: IconButton(
                        onPressed: () {
                          _pageController.nextPage(
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
            Divider(
              color: Color(0xffffffff).withOpacity(0.5),
              height: 0,
              thickness: 0.5.sp,
            ),
            Container(
              height: 27,
              decoration: BoxDecoration(
                color: widget.isTodayTopic
                    ? PrimaryVariant1Color
                    : SecondaryLColor.withOpacity(0.75),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),

                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Color(0xffffff).withOpacity(0.2),
                //     PrimaryVariant1Color
                //   ]
                // )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(board.nickname,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF))),
                    padding: EdgeInsets.only(left: 29.w),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 29.w),
                    child: Row(
                      children: [
                        ImageIcon(AssetImage("image/likeIcon.png"),
                            color: TextPrimaryColor),
                        Text(board.likes.toString(),
                            style: TextStyle(
                                color: TextPrimaryColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500)),
                        ImageIcon(AssetImage("image/commentIcon.png"),
                            color: TextPrimaryColor),
                        Text(board.comments!.length.toString(),
                            style: TextStyle(
                                color: TextPrimaryColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

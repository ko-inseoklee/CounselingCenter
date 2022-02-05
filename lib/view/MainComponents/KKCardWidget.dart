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
    // TODO: implement initState
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
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),
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
              padding: EdgeInsets.only(top: 2.h),
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
    var idx = 0;
    return widget.hotPosts.map((e) => buildCard(e, ++idx)).toList();
  }

  Widget buildCard(Board board, int idx){
    return Center(
            child: Container(
              width: 288.w,
              height: 158.h,
              margin: EdgeInsets.only(bottom: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              boxShadow: [BoxShadow(
              color: DisabledColor.withOpacity(0.75),
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 2.0),
              )]),
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
                    child: Text("Best $idx",
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
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          width: 35.w,
                          height: 45.h,
                          // padding: EdgeInsets.only(top: 44.01.h),
                          child: IconButton(
                            onPressed: () {
                              _pageController.previousPage(
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
                            'Q. ${board.title}',
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
                  Container(
                    height: 27.h,
                    decoration: BoxDecoration(
                        color: SecondaryLColor,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
                    ),
                    child:Row(
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
                                      fontWeight: FontWeight.w500)
                              ),
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

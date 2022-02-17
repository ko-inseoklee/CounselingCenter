import 'package:flutter/material.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';

class TodayTopicWithAnswer extends StatelessWidget {
  final TodayTopic topic;

  const TodayTopicWithAnswer({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 23.h,
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
              children: [
                Text("오늘의 주제",style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),),
                Icon(Icons.arrow_forward_ios_outlined,size: 14.sp,)
              ],
            ),
          ),
          Container(
            width: 288.w,
            height: 328.h,
            child: Column(
              children: [
                Container(
                  height: 214.h,
                  decoration: BoxDecoration(
                    color: PrimaryVariant1Color,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(35))
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 49.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("image/Intersect_0.png"),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.centerLeft,
                                  )),
                              width: 150.w,
                              height: 49.h,
                              padding: EdgeInsets.only(left: 14.w, top: 9.h),
                              child: Text(topic.date,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF))),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 18.w,top: 13.h),
                              alignment: Alignment.topCenter,
                              child: Text("by producer"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.h),
                        width: 215.w,
                        height: 45.h,
                        child:Text(
                        '${topic.question}',
                        // text,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              width: 35.w,
                              height: 45.h,
                              child: IconButton(
                                //TODO: move to the previous page.
                                onPressed: () {
                                  // _pageController.previousPage(
                                  //     duration: Duration(milliseconds: 400),
                                  //     curve: Curves.easeIn);
                                },
                                icon:
                                ImageIcon(AssetImage("image/navigateBeforeIcon.png")),
                                color: Color(0xffffffff).withOpacity(0.6),
                              ),
                            ),
                            Container(
                              width: 218.w,
                              height: 93.h,
                              padding: EdgeInsets.only(left: 11.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                  ),
                                  hintText: '답변하기',
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)
                                  )
                                ),
                              )
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 35.w,
                              height: 45.h,
                              child: IconButton(
                                //TODO: move to the next page.
                                  onPressed: () {
                                    // _pageController.nextPage(
                                    //     duration: Duration(milliseconds: 400),
                                    //     curve: Curves.easeIn);
                                  },
                                  icon: ImageIcon(
                                    AssetImage("image/navigateNextIcon.png"),
                                    color: Color(0xffffffff).withOpacity(0.6),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
                Container(
                  height: 114.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))

          ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

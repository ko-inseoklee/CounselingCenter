import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/view/Board/TopicInput.dart';

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
            height: 23,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text("오늘의 주제",style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),),
                Icon(Icons.arrow_forward_ios_outlined,size: 14.sp,)
              ],
            ),
          ),
          Container(
            width: 288.w,
            height: 328,
            child: Column(
              children: [
                Container(
                  height: 214,
                  decoration: BoxDecoration(
                    color: PrimaryVariant1Color,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(35))
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 49,
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
                              height: 49,
                              padding: EdgeInsets.only(left: 14.w, top: 9),
                              child: Text(topic.date,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF))),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 18.w,top: 13),
                              alignment: Alignment.topCenter,
                              child: Text("by producer"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        width: 215.w,
                        height: 45,
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
                              height: 45,
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
                              height: 93,
                              padding: EdgeInsets.only(left: 11.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              alignment: Alignment.topLeft,
                              child:
                                TextButton(onPressed: () {
                                  Get.bottomSheet(TopicInput());
                                },
                                  child: Text("답변하기",style: TextStyle(color: Color(0xffAAAAAA)),),
                                ),
                              /*TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                  ),
                                  hintText: '답변하기',
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)
                                  )
                                ),
                              )*/
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 35.w,
                              height: 45,
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
                  height: 114,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 36,
                        padding: EdgeInsets.only(top: 11, left: 16.w),
                        child: Row(
                          children: [
                            Text("BEST", style: TextStyle(color: PrimaryVariant1Color, fontWeight: FontWeight.w700, fontSize: 13.sp),),
                            Container(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Text(topic.comments![0].title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13.sp)),
                            ),

                          ],
                        ),
                      ),
                      Divider(indent: 16.w,endIndent: 14.w,),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 16.w,top: 4,bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(topic.comments![0].contents,style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Text('20대', style: TextStyle(color: Color(0xffAAAAAA)),),
                                  margin: EdgeInsets.only(left: 16.w, right: 8.w),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: Text(topic.writerID, style: TextStyle(color: Color(0xffAAAAAA)),),
                                  constraints: BoxConstraints(
                                      minWidth: 131.w
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2.w),
                                  child: Icon(Icons.favorite_border,size: 10.sp,color: PrimaryVariant1Color,),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 16.w),
                                  child: Text(topic.likes.toString(),  style: TextStyle(color: Colors.black,),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 2.w),

                                  child: Icon(Icons.sms,size: 10.sp,color:PrimaryVariant1Color,),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 16.w),
                                  child: Text(topic.comments![0].re.length.toString(),  style: TextStyle(color: Colors.black,),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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

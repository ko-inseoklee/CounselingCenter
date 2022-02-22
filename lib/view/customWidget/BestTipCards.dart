import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';

class BestTipCards extends StatelessWidget {
  final String title;
  const BestTipCards({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 16.w),
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  title,
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
          width: 288.w,
          height: 296,
          child: Row(
            children: [
              Container(
                width: 138.w,
                child: Column(
                  children: [
                    Container(
                      width: 138.w,
                      height: 114,
                      decoration: BoxDecoration(
                        color: SecondaryLColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 138.w,
                            height: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("image/Intersect_1.png"),
                              // fit: BoxFit.contain,
                              scale: 0.8,
                              alignment: Alignment.topLeft,
                            )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 55.w,
                                  height: 80,
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 55.w,
                                          height: 69,
                                          padding: EdgeInsets.only(
                                              top: 11.78, left: 7.92.w),
                                          child: Image.asset(
                                            'image/20sIcon.png',
                                            width: 40.24.w,
                                            height: 30.51,
                                            alignment: Alignment.topLeft,
                                          )),
                                      Container(
                                        width: 55.w,
                                        padding: EdgeInsets.only(left: 6.w),
                                        child: Image.asset(
                                          'image/Ellipse_31.png',
                                          color: Color(0xff28B7F4)
                                              .withOpacity(0.51),
                                          width: 8.sp,
                                          height: 8.sp,
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: 83.w,
                                    height: 80,
                                    padding:
                                        EdgeInsets.only(right: 16.w, top: 19),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text('20대 꿀팁',
                                              style: TextStyle(
                                                  color: Color(0xffffffff),
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        Container(
                                          child: Text('돈 언제 모을지 막막하지?',
                                              softWrap: true,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Color(0xffffffff),
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),

                          // #적금 #청년 #정책
                          Container(
                              padding: EdgeInsets.only(top: 11),
                              width: 138.w,
                              height: 34,
                              child: Container(
                                width: 139.w,
                                height: 34,
                                padding: EdgeInsets.only(
                                  left: 19.w,
                                  right: 19,
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      miniWhiteBox('적금', 1),
                                      SizedBox(width: 8.w),
                                      miniWhiteBox('청년', 1),
                                      SizedBox(width: 8.w),
                                      miniWhiteBox('정책', 1)
                                    ]),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                        width: 138.w,
                        height: 159,
                        decoration: BoxDecoration(
                            color: Color(0xff0085FF).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          children: [
                            Container(
                                width: 138.w,
                                height: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("image/Intersect_3.png"),
                                    scale: 0.8,
                                    alignment: Alignment.topLeft,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 138.w,
                                      height: 65,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 73.w,
                                              height: 65,
                                              padding: EdgeInsets.only(
                                                  top: 17.75, left: 14.17.w),
                                              child: Image.asset(
                                                'image/30sIcon.png',
                                                width: 31.67.w,
                                                height: 28.5,
                                                alignment: Alignment.topLeft,
                                              )),
                                          Container(
                                              width: 65.w,
                                              height: 65,
                                              padding: EdgeInsets.only(
                                                  right: 18.w, top: 45),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '30대 꿀팁',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                // textAlign: TextAlign.end,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: 138.w,
                                        height: 45,
                                        padding: EdgeInsets.only(top: 7),
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 36.w,
                                                height: 45,
                                                padding:
                                                    EdgeInsets.only(left: 7.w),
                                                child: Image.asset(
                                                  'image/Ellipse_40.png',
                                                  color: Color(0xff469BE9),
                                                  // fit: BoxFit.fitWidth,
                                                  width: 8.sp,
                                                  height: 8.sp,
                                                  alignment: Alignment.topLeft,
                                                )),
                                            Container(
                                              width: 102.w,
                                              height: 45,
                                              padding:
                                                  EdgeInsets.only(right: 18.w),
                                              child: Text('이직 준비하고 있다면 지금이야!',
                                                  softWrap: true,
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Color(0xffffffff),
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            )
                                          ],
                                        )),
                                  ],
                                )),
                            Container(
                                width: 138.w,
                                height: 49,
                                padding: EdgeInsets.only(top: 26),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    miniWhiteBox('이직', 3),
                                    SizedBox(width: 8.w),
                                    miniWhiteBox('취업', 3),
                                    SizedBox(width: 8.w),
                                    miniWhiteBox('직장', 3)
                                  ],
                                ))
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                  width: 138.w,
                  child: Column(
                    children: [

                      Container(
                          margin: EdgeInsets.all(0),
                          width: 138.w,
                          height: 159,
                          constraints: BoxConstraints(
                            minWidth: 138.w,
                            minHeight: 159,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage('image/bg_13.png'),
                                fit: BoxFit.cover,

                                // alignment: Alignment.center,
                              )),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 45,
                                  padding: EdgeInsets.only(
                                      top: 14.33, left: 14.39.w),
                                  child: Container(
                                      width: 33.26.w,
                                      height: 33.28,
                                      child:
                                          Image.asset('image/playTipIcon.png')),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 22.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Text('오락 꿀팁',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 9),
                            Container(
                              child: Container(
                                width: 90.w,
                                child: Text(
                                  '전 세대적 유행한 오락게임!',
                                  softWrap: true,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(height: 27),
                            Container(
                              height: 12,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  miniWhiteBox('게임', 2),
                                  SizedBox(width: 8.w),
                                  miniWhiteBox('가족', 2),
                                  SizedBox(width: 8.w),
                                  miniWhiteBox('화목', 2),
                                ],
                              )
                            )
                          ])),
                      SizedBox(height: 12),
                      Container(
                          width: 138.w,
                          height: 114,
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                image: AssetImage('image/bg_14.png',),
                                fit: BoxFit.contain,
                                // alignment: Alignment.center,
                              )
                          ),
                        // child:
                      )
                    ],
                  ))
            ],
          ),
        )
      ],
    ));
  }

  Widget miniWhiteBox(String contents, int idx) {
    return Container(
      width: 28.w,
      height: 12,
      decoration: BoxDecoration(
          color: Color(0xffffffff), borderRadius: BorderRadius.circular(18.sp)),
      padding: EdgeInsets.only(top: 1, bottom: 1),
      child: Text(
        '#$contents',
        style: TextStyle(
          color: (idx == 1
              ? Color(0xff45C5F9)
              : (idx == 2 ? Color(0xff5C96E2) :(idx == 3 ? Color(0xff469BE9) : (Colors.black)))),
          fontSize: 7.sp,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

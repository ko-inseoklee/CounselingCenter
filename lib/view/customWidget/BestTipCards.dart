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
          child:
              // Row(
              //   children: [
              // Text(
              //   title,
              //   style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              // ),
              // IconButton(
              //   onPressed: () {},
              //   icon: ImageIcon(AssetImage("image/navigateNextIcon.png")),
              //   color: Color(0xff111111),
              // ),
              TextButton(
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
          // ],
          // ),
        ),
        Container(
          width: 288.w,
          height: 296.h,
          child: Row(
            children: [
              Container(
                width: 138.w,
                child: Column(
                  children: [
                    Container(
                      width: 138.w,
                      height: 114.h,
                      decoration: BoxDecoration(
                          color: SecondaryLColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 138.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("image/Intersect_1.png"),
                              // fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                            )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Column(
                                //   children: [
                                //     Container(
                                //         width: 72.w,
                                //         height: 62.h,
                                //         child: Image.asset(
                                //           'image/Intersect_1.png',
                                //           fit: BoxFit.fill,
                                //         )),
                                //     Container(
                                //       child: Image.asset(name)
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 138.w,
                      height: 159.h,
                      decoration: BoxDecoration(
                          color: Color(0xff0085FF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(24)),
                    )
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                  width: 138.w,
                  child: Column(
                    children: [
                      Container(
                          width: 138.w,
                          height: 159.h,
                          decoration: BoxDecoration(
                              color: Color(0xff206DD3).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(24))),
                      SizedBox(height: 12.h),
                      Container(
                          width: 138.w,
                          height: 114.h,
                          decoration: BoxDecoration(
                              color: Color(0xff226FB7).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(24)))
                    ],
                  ))
            ],
          ),
        )
      ],
    ));
  }
}

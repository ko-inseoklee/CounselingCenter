import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/view/Login/FindIDPage.dart';
import 'package:online_counseling_center/view/Login/LoginPage.dart';
import 'package:get/get.dart';

class FindIDResultPage extends StatelessWidget {
  const FindIDResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(51.h),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4.sp),
                  color: Color(0xff000000).withOpacity(0.04),
                  blurRadius: 10.sp)
            ],
          ),
          child: AppBar(
            backgroundColor: WhiteColor,
            automaticallyImplyLeading: false,
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.sp),
                    bottomRight: Radius.circular(30.sp))),
            leading: Container(
                width: 24.w,
                child: TextButton(
                  child: Image.asset(
                    'image/navigateBeforeIcon_2.png',
                    color: PrimaryColor,
                  ),
                  onPressed: () {
                    Get.to(FindIDPage());
                  },
                )),
            title: Text(
              '아이디 찾기',
              style: TextStyle(
                  color: TextBodyColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 18.h, left: 25.w),
                  child: Text(
                    '회원정보와 일치하는\n아이디를 확인해주세요.',
                    style: TextStyle(
                        color: Gray2Color,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  )),
              Container(
                padding: EdgeInsets.only(top: 19.h, left: 16.w),
                child: Row(
                  children: [
                    Container(
                      width: 20.sp,
                      child: Image.asset('image/login/foundIDIcon.png'),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      // TODO: 찾은 아이디 결과 보여주기
                      'yire0326@gmail.com',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: TextBodyColor),
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: 288.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  // Color(0xffDDDDDD),
                  borderRadius: BorderRadius.circular(24.sp),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(4.sp, 4.sp),
                        color: Color(0xff000000).withOpacity(0.08),
                        blurRadius: 20.sp)
                  ],
                ),
                child: TextButton(
                  child: Text(
                    '로그인',
                    style: TextStyle(
                        color: WhiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    Get.off(LoginPage());
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => PrimaryVariant3Color),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.sp),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Container(
                width: 288.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color(0xffDDDDDD),
                  borderRadius: BorderRadius.circular(24.sp),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(4.sp, 4.sp),
                        color: Color(0xff000000).withOpacity(0.08),
                        blurRadius: 20.sp)
                  ],
                ),
                child: TextButton(
                  child: Text(
                    '비밀번호 찾기',
                    style: TextStyle(
                        color: WhiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => GrayButtonDown),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.sp),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          )
        ],
      ),
    );
  }
}

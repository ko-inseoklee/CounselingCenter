import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/view/Login/LoginPage.dart';

import '../customWidget/SignUpTextbox.dart';

class ResetPwPage extends StatefulWidget {
  const ResetPwPage({Key? key}) : super(key: key);

  @override
  State<ResetPwPage> createState() => _ResetPwPageState();
}

class _ResetPwPageState extends State<ResetPwPage> {
  TextEditingController pwController = TextEditingController();
  TextEditingController doubleCheckController = TextEditingController();

  bool isPwValid = false;
  bool doubleCheckedPw = false;

  @override
  void initState() {
    super.initState();
    pwController.addListener(_checkPwField);
    doubleCheckController.addListener(_doubleCheckPwField);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(51.h),
          child: Container(
            padding: EdgeInsets.only(top: 15.h),
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
                      Navigator.pop(context);
                    },
                  )),
              title: Text(
                '비밀번호 재설정',
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
              Column(children: [
                Container(
                    padding: EdgeInsets.only(top: 18.h, left: 25.w),
                    child: Row(
                      children: [
                        Text(
                          '새로운 비밀번호를\n입력해 주세요.',
                          style: TextStyle(
                              color: Gray2Color,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                SizedBox(height: 19.h),
                Container(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Row(
                      children: [
                        Text(
                          '아이디 : ',
                          style: TextStyle(
                              color: TextBodyColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'yire0326@gmail.com',
                          style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
                SizedBox(height: 12.h),
                SignUpTextButton(
                    width: 288.w,
                    height: 48.h,
                    autocheck: true,
                    isValid: isPwValid,
                    textEditingController: pwController,
                    hintText: '새 비밀번호 (영문, 숫자 포함된 8자리 이상)',
                    isObscure: false),
                SizedBox(height: 14.h),
                SignUpTextButton(
                    width: 288.w,
                    height: 48.h,
                    autocheck: true,
                    isValid: doubleCheckedPw,
                    textEditingController: doubleCheckController,
                    hintText: '새 비밀번호 확인',
                    isObscure: false),
                if (doubleCheckedPw)
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 33.w, top: 10.h),
                    child: Text(
                      '비밀번호가 일치합니다.',
                      style: TextStyle(
                          color: SecondaryLColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  )
              ]),
              Container(
                width: 288.w,
                height: 48.h,
                margin: EdgeInsets.only(bottom: 30.h),
                decoration: BoxDecoration(
                  color: doubleCheckedPw ? PrimaryColor : Color(0xffDDDDDD),
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
                    '확인',
                    style: TextStyle(
                        color: WhiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    if (doubleCheckedPw) {
                      Get.to(LoginPage());
                    }
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) =>
                        doubleCheckedPw
                            ? PrimaryVariant3Color
                            : Color(0xffDDDDDD)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ]));
  }

  void _checkPwField() {
    String password = pwController.text;
    if (password.length >= 8 &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp('[a-zA-Z]+')))
      setState(() {
        isPwValid = true;
      });
    else
      setState(() {
        isPwValid = false;
      });
  }

  void _doubleCheckPwField() {
    String password = pwController.text;
    if (doubleCheckController.text == password) {
      setState(() {
        doubleCheckedPw = true;
      });
    } else
      setState(() {
        doubleCheckedPw = false;
      });
  }
}

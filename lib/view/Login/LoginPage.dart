import 'package:flutter/material.dart';

import 'package:online_counseling_center/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/view/HomePage.dart';
import 'package:online_counseling_center/view/customWidget/LoginTextbox.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  bool isIdEmpty = true;
  bool isPwdEmpty = true;

  bool isLoginValid = true;

  @override
  void initState() {
    super.initState();
    // nameController에 리스너 추가
    idController.addListener(_checkIdField);
    pwdController.addListener(_checkPwdField);
  }

  // _SignUpNamePageState 제거될 때 호출
  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    idController.dispose();
    pwdController.dispose();
    super.dispose();
  }

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
                      color: TextBodyColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              title: Text(
                '로그인',
                style: TextStyle(
                    color: TextBodyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.only(top: 28.h, left: 22.w),
              child: Text(
                '넉넉을 통해\n온 세대가 함께하는\n이야기에 참여하세요.',
                style: TextStyle(
                    color: Gray2Color,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(height: 28.h),
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // height: ScreenUtil.defaultSize.height - (240.h),
                  height: 234.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginTextBox(
                        width: 288.w,
                        height: 48.h,
                        textEditingController: idController,
                        hintText: '아이디',
                        isObscure: false,
                        isEmpty: isIdEmpty,
                      ),
                      SizedBox(height: 14.h),
                      LoginTextBox(
                          width: 288.w,
                          height: 48.h,
                          textEditingController: pwdController,
                          hintText: '비밀번호',
                          isObscure: true,
                          isEmpty: isPwdEmpty),
                      SizedBox(height: 10.h),
                      if (!isLoginValid)
                      Container(
                        padding: EdgeInsets.only(left: 14.w),
                        child: Text(
                          '아이디 또는 비밀번호를 잘못 입력하셨습니다.',
                          style:
                              TextStyle(color: AlertRedColor, fontSize: 9.sp),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 105.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          // width: 163.w,
                          height: 16.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '아이디 찾기',
                                  style: TextStyle(
                                      color: Gray2Color,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              SizedBox(width: 9.w),
                              VerticalDivider(
                                color: Gray2Color,
                                thickness: 0.2,
                                width: 0,
                                indent: 2.h,
                                endIndent: 2.h,
                              ),
                              SizedBox(width: 9.w),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '비밀번호 찾기',
                                  style: TextStyle(
                                      color: Gray2Color,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              SizedBox(width: 9.w),
                              VerticalDivider(
                                color: Gray2Color,
                                thickness: 0.2,
                                width: 0,
                                indent: 2.h,
                                endIndent: 2.h,
                              ),
                              SizedBox(width: 9.w),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '회원가입',
                                  style: TextStyle(
                                      color: Gray2Color,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 13.h),
                      Container(
                        width: 320.w,
                        height: 48.h,
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                            color: (!isIdEmpty && !isPwdEmpty)
                                ? PrimaryColor
                                : Color(0xffDDDDDD),
                            borderRadius: BorderRadius.circular(24.sp)),
                        child: TextButton(
                          child: Text(
                            '로그인',
                            style: TextStyle(
                                color: WhiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            // TODO: 로그인 정보 db와 일치하는지 확인

                            // 일치할 경우
                            // if () {
                              // user["name"] = nameController.text;
                              // user["phoneNumber"] = phoneController.text;
                            setState(() {
                              isLoginValid = true;
                            });
                              Get.to(HomePage());
                            // }

                            // 일치하지 않을 경우
                            // else {
                            //  setState(() {
                            //  isLoginValid = false;
                            // });
                            // }
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => (!isIdEmpty && !isPwdEmpty)
                                    ? PrimaryVariant3Color
                                    : Color(0xffDDDDDD)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }

  void _checkIdField() {
    if (idController.text.isEmpty)
      setState(() {
        isIdEmpty = true;
      });
    else
      setState(() {
        isIdEmpty = false;
      });
  }

  void _checkPwdField() {
    if (pwdController.text.isEmpty)
      setState(() {
        isPwdEmpty = true;
      });
    else
      setState(() {
        isPwdEmpty = false;
      });
  }
}

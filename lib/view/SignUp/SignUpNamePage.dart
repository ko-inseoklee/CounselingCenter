import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_counseling_center/color.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/ignore.dart';
import 'package:online_counseling_center/view/SignUp/SignUpEmailPage.dart';
import 'package:online_counseling_center/view/customWidget/SignUpTextbox.dart';

class SignUpNamePage extends StatefulWidget {
  const SignUpNamePage({Key? key}) : super(key: key);

  @override
  _SignUpNamePageState createState() => _SignUpNamePageState();
}

class _SignUpNamePageState extends State<SignUpNamePage> {
  Map<String,dynamic> user = {};

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController validationNumController = TextEditingController();

  bool isNameValid = false;
  bool isTyping = false;
  bool isPhoneValid = false;
  bool sentMessage = false;

  bool checkedValidNum = false;
  bool isValidationNumValid = false;
  bool isValidationNumCorrect = false;

  @override
  void initState() {
    super.initState();
    // nameController에 리스너 추가
    nameController.addListener(_checkNameField);
    phoneController.addListener(_checkPhoneField);
    validationNumController.addListener(_checkNumField);
  }

  // _SignUpNamePageState 제거될 때 호출
  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    nameController.dispose();
    phoneController.dispose();
    validationNumController.dispose();
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
                '회원가입',
                style: TextStyle(
                    color: TextBodyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: ScreenUtil.defaultSize.height - (240.h),
                    child: Column(
                      children: [
                        SignUpTextButton(
                            width: 288.w,
                            height: 48.h,
                            autocheck: true,
                            isValid: isNameValid,
                            textEditingController: nameController,
                            hintText: '이름  ex)홍길동',
                            isObscure: false
                        ),
                        SizedBox(height: 14.h),
                        Container(
                            width: 291.w,
                            height: 98.h,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.08),
                                  offset: Offset(4.sp, 4.sp),
                                  blurRadius: 20.sp,
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.sp),
                              border: (isTyping)
                                  ? Border.all(color: PrimaryColor, width: 1.sp)
                                  : Border.all(
                                      color: Color(0xffffffff), width: 0),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 288.w,
                                      height: 48.h,
                                      child: TextField(
                                        style: TextStyle(
                                            color: TextBodyColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                        controller: phoneController,
                                        onTap: () {
                                          setState(() {
                                            isTyping = true;
                                          });
                                        },
                                        onEditingComplete: () =>
                                            isTyping = false,
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                              fontSize: 12.sp,
                                              color: Gray2Color,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            hintText: '전화번호  ex) 01012345678',
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 17.w, top: 15.5.h),
                                            // focusedBorder: OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //       color: PrimaryColor,
                                            //       width: 1.sp),
                                            //   borderRadius: BorderRadius.only(
                                            //     topLeft: Radius.circular(16.sp),
                                            //     topRight:
                                            //         Radius.circular(16.sp),
                                            //   ),
                                            // ),
                                            suffixIcon:
                                                // phoneValid
                                                //     ?
                                                Container(
                                                    height: 48.h,
                                                    padding: EdgeInsets.only(
                                                        right: 7.w),
                                                    child:
                                                        isValidationNumCorrect
                                                            ? Container(
                                                          padding: EdgeInsets.only(top: 15.h, right: 10.w),
                                                              child: Text(
                                                                  '인증완료',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.sp,
                                                                      color:
                                                                          Gray2Color,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                            )
                                                            : TextButton(
                                                                onPressed: () async {
                                                                  print(phoneController.text);
                                                                  await dio.Dio().post("$apiServer/user/phoneAuth-request?phoneNumber=${phoneController.text}");
                                                                  // TODO: 전화번호 인증 api

                                                                  setState(() {
                                                                    sentMessage =
                                                                        true;
                                                                    checkedValidNum =
                                                                        false;
                                                                    isValidationNumCorrect =
                                                                        false;
                                                                    validationNumController
                                                                        .text = '';
                                                                  });
                                                                },
                                                                child:
                                                                    !sentMessage
                                                                        ? Text(
                                                                            '인증번호 받기',
                                                                            style: TextStyle(
                                                                                fontSize: 13.sp,
                                                                                color: isPhoneValid ? SecondaryLColor : Gray2Color,
                                                                                fontWeight: FontWeight.w700),
                                                                          )
                                                                        : Text(
                                                                            '인증번호 다시 받기',
                                                                            style: TextStyle(
                                                                                fontSize: 13.sp,
                                                                                color: SecondaryLColor,
                                                                                fontWeight: FontWeight.w700),
                                                                          )))),
                                        showCursor: false,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                    thickness: 0.5.sp,
                                    height: 0,
                                    color: Color(0xff000000).withOpacity(0.1)),
                                Container(
                                  width: 288.w,
                                  height: 48.h,
                                  child: TextField(
                                    style: TextStyle(
                                        color: TextBodyColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                    controller: validationNumController,
                                    onTap: () {
                                      setState(() {
                                        isTyping = true;
                                      });
                                    },
                                    onEditingComplete: () => isTyping = false,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Gray2Color,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      hintText: '인증번호',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 17.w, top: 15.h),
                                      suffixIcon: !isValidationNumCorrect
                                          ? Container(
                                              height: 48.h,
                                              padding:
                                                  EdgeInsets.only(right: 7.w),
                                              child: TextButton(
                                                  onPressed: () async {
                                                    // TODO: 인증번호 일치 여부 확인
                                                    dio.Response response = await dio.Dio().post("$apiServer/user/phoneAuth-validate?phoneNumber=${phoneController.text}&code=${validationNumController.text}");

                                                    setState(() {
                                                      if(response.data){
                                                        checkedValidNum = true;
                                                        isValidationNumCorrect =
                                                        true;
                                                      }
                                                    });
                                                  },
                                                  child: Text(
                                                    '인증하기',
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        color:
                                                            isValidationNumValid
                                                                ? SecondaryLColor
                                                                : Gray2Color,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )))
                                          : Container(
                                              padding:
                                                  EdgeInsets.only(right: 15.w),
                                              width: 24.w,
                                              height: 48.h,
                                              child: Image.asset(
                                                  'image/signUpCheckIcon.png')),
                                    ),
                                    showCursor: false,
                                  ),
                                ),
                              ],
                            )),
                        if (sentMessage || checkedValidNum)
                          Container(
                              padding: EdgeInsets.only(left: 14.w, top: 10.h),
                              alignment: Alignment.centerLeft,
                              child: checkedValidNum
                                  ? ((isValidationNumCorrect)
                                      ? Text('전화번호 인증 완료',
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              color: SecondaryLColor))
                                      : Text('인증번호가 틀렸습니다. 다시 확인 해주세요.',
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              color: AlertRedColor)))
                                  : Text('인증번호를 전송했습니다.',
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          color: SecondaryLColor))),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 78.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 320.w,
                          height: 48.h,
                          margin: EdgeInsets.only(bottom: 16.h),
                          padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          decoration: BoxDecoration(
                              color: (isNameValid && isValidationNumCorrect)
                                  ? PrimaryColor
                                  : Color(0xffDDDDDD),
                              borderRadius: BorderRadius.circular(24.sp)),
                          child: TextButton(
                            child: Text(
                              '다음',
                              style: TextStyle(
                                  color: WhiteColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              if (isNameValid && isValidationNumCorrect) {
                                user["name"] = nameController.text;
                                user["phoneNumber"] = phoneController.text;
                                Get.to(SignUpEmailPage(user: user,));
                              }
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      (isNameValid && isValidationNumCorrect)
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
            ),
          ],
        ));
  }

  void _checkNameField() {
    if (nameController.text.isNotEmpty)
      setState(() {
        isNameValid = true;
      });
    else
      setState(() {
        isNameValid = false;
      });
  }

  void _checkPhoneField() {
    // if (phoneController.)

    if (phoneController.text.isNotEmpty)
      setState(() {
        isPhoneValid = true;
      });
    else
      setState(() {
        isPhoneValid = false;
      });
  }

  void _checkNumField() {
    if (validationNumController.text.isNotEmpty)
      setState(() {
        isValidationNumValid = true;
      });
    else
      setState(() {
        isValidationNumValid = false;
      });
  }
}

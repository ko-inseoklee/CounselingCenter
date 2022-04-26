// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/view/SignUp/SignUpNicknamePage.dart';
import 'package:online_counseling_center/view/customWidget/SignUpTextbox.dart';
import 'package:online_counseling_center/dummy/signUpEmailList.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../ignore.dart';

class SignUpEmailPage extends StatefulWidget {
  Map<String,dynamic> user;
  SignUpEmailPage({Key? key, required this.user}) : super(key: key);

  @override
  _SignUpEmailPageState createState() => _SignUpEmailPageState();
}

class _SignUpEmailPageState extends State<SignUpEmailPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pw1Controller = TextEditingController();
  TextEditingController pw2Controller = TextEditingController();
  bool isIdValid = false;
  bool checkedDuplicateId = false;

  bool isPw1Valid = false;
  bool isPw2Valid = false;
  bool isPw2Empty = true;

  @override
  void initState() {
    super.initState();
    pw1Controller.addListener(checkPw1Field);
    pw2Controller.addListener(checkPw2Field);

    print("init user => {name : ${widget.user["name"]}, phoneNumber : ${widget.user["phoneNumber"]}}");
  }

  // _SignUpNamePageState 제거될 때 호출
  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    pw1Controller.dispose();
    pw2Controller.dispose();
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
                  '로그인에 사용할\n아이디와 비밀번호를\n입력해주세요.',
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
                    // height: 252.h,
                    height: ScreenUtil.defaultSize.height - (240.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(children: [
                          SignUpTextButton(
                              width: 130.w,
                              height: 48.h,
                              autocheck: false,
                              isValid: false,
                              textEditingController: idController,
                              hintText: '아이디'),
                          Container(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Text('@',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Gray2Color))),
                          Container(
                            width: 130.w,
                            height: 48.h,
                            padding: EdgeInsets.only(
                                top: 5.h, left: 12.w, right: 16.w),
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000).withOpacity(0.08),
                                    offset: Offset(4.sp, 4.sp),
                                    blurRadius: 20.sp,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16.sp)),
                            child: DropdownButton(
                              value: selectedValue,
                              items: emailList.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              style: TextStyle(
                                  color: Gray2Color,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                              menuMaxHeight: 184.h,
                              underline: Container(),
                              isExpanded: true,
                              // dropdownElevation: 0,
                              // dropdownWidth: 130.w,
                              // dropdownDecoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(16.sp),
                              //   // color: Colors.redAccent,
                              // ),
                              iconEnabledColor: Gray2Color,
                              icon: Container(
                                  // decoration: BoxDecoration(border: Border.all()),
                                  // width: 25.w,
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset('image/dropdownIcon.png'),
                                ],
                              )),
                              iconSize: 16.w,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                              },
                            ),
                          )
                        ]),
                        Container(
                            width: 320.w,
                            padding: EdgeInsets.only(
                                left: 13.w, top: 9.h, right: 7.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                (!checkedDuplicateId)
                                    ? Text('')
                                    : isIdValid
                                        ? Text('사용 가능한 아이디입니다.',
                                            style: TextStyle(
                                                color: SecondaryLColor,
                                                fontSize: 9.sp))
                                        : Text('이미 사용중인 아이디입니다.',
                                            style: TextStyle(
                                                color: AlertRedColor,
                                                fontSize: 9.sp)),
                                // SizedBox(
                                //     width: !checkedDuplicateId ? 200.w : 120.w),
                                TextButton(
                                  child: Text(
                                    isIdValid ? '중복확인 완료' : '중복확인',
                                    style: TextStyle(
                                        color: isIdValid
                                            ? Gray2Color
                                            : SecondaryLColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () async{
                                    dio.Response response = await dio.Dio().get("$apiServer/users/verify-nickname?nickname=${idController.text + "@" + selectedValue}");
                                    isIdValid = response.data;
                                    if (idController.text.isNotEmpty &&
                                        !isIdValid) {
                                      setState(() {
                                        checkedDuplicateId = true;
                                      });
                                      checkIdField();
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 16.h),
                        SignUpTextButton(
                          width: 288.w,
                          height: 48.h,
                          autocheck: true,
                          isValid: isPw1Valid,
                          textEditingController: pw1Controller,
                          hintText: '비밀번호  (영문, 숫자 포함된 8자리 이상)',
                        ),
                        SizedBox(height: 14.h),
                        SignUpTextButton(
                            width: 288.w,
                            height: 48.h,
                            autocheck: true,
                            isValid: isPw2Valid,
                            textEditingController: pw2Controller,
                            hintText: '비밀번호 확인'),
                        SizedBox(height: 10.h),
                        if (!isPw2Empty)
                          Container(
                              padding: EdgeInsets.only(left: 17.w),
                              alignment: Alignment.centerLeft,
                              child: !isPw2Valid
                                  ? Text(
                                      '비밀번호가 서로 다릅니다.',
                                      style: TextStyle(
                                          color: Color(0xffF12C2C),
                                          fontSize: 9.sp),
                                    )
                                  : Text(
                                      '비밀번호가 일치합니다.',
                                      style: TextStyle(
                                          color: SecondaryLColor,
                                          fontSize: 9.sp),
                                    ))
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
                              color: (isIdValid && isPw2Valid)
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
                              if (isIdValid && isPw2Valid) {
                                String email = idController.text + "@" + selectedValue;
                                widget.user["id"] = email;
                                widget.user["password"] = pw1Controller.text;

                                Get.to(SignUpNicknamePage(user: widget.user,));
                              }
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => (isIdValid && isPw2Valid)
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
            Expanded(
              child: Container(),
            ),
          ],
        ));
  }

  void checkIdField() {
    if (idController.text.isNotEmpty) {
      // TODO: 아이디 중복확인

      setState(() {
        isIdValid = true;
      });
    } else
      setState(() {
        isIdValid = false;
      });
  }

  void checkPw1Field() {
    String pwd = pw1Controller.text;
    bool hasDigits = pwd.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = pwd.contains(new RegExp(r'[a-z]'));
    bool hasUppercase = pwd.contains(new RegExp(r'[A-Z]'));

    if (pwd.length >= 8 && hasDigits && (hasLowercase || hasUppercase)) {
      setState(() {
        isPw1Valid = true;
      });
    } else
      setState(() {
        isPw1Valid = false;
      });
  }

  void checkPw2Field() {
    if (isPw1Valid && pw2Controller.text.isNotEmpty) {
      if (pw2Controller.text.isNotEmpty)
        setState(() {
          isPw2Empty = false;
        });
      if (pw2Controller.text == pw1Controller.text)
        setState(() {
          isPw2Valid = true;
        });
      else
        setState(() {
          isPw2Valid = false;
        });
    } else
      setState(() {
        isPw2Empty = true;
        isPw2Valid = false;
      });
  }
}

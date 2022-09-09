import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/view/Login/ResetPwPage.dart';
import 'package:online_counseling_center/view/customWidget/SignUpTextbox.dart';
import 'package:get/get.dart';


class ResetPw_AuthenticatePage extends StatefulWidget {
  const ResetPw_AuthenticatePage({Key? key}) : super(key: key);

  @override
  State<ResetPw_AuthenticatePage> createState() =>
      _ResetPw_AuthenticatePageState();
}

class _ResetPw_AuthenticatePageState extends State<ResetPw_AuthenticatePage> {
  TextEditingController phoneVerificationNameController =
  TextEditingController();
  TextEditingController emailVerificationNameController =
  TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneVerificationNumController =
  TextEditingController();
  TextEditingController emailVerificationNumController =
  TextEditingController();

  bool isPhoneVerificationMode = true;

  // 이름
  bool isPhoneVerificationNameValid = false;
  bool isEmailVerificationNameValid = false;
  // 전화번호 or 이메일
  bool isTypingPhone = false;
  bool isTypingEmail = false;
  bool isPhoneValidationNumValid = false;
  bool isPhoneValidationNumCorrect = false;
  bool isEmailValidationNumValid = false;
  bool isEmailValidationNumCorrect = false;

  bool isPhoneValid = false; // 휴대폰 번호 길이 valid 한지
  bool isEmailValid = false;

  bool sentMessage = false;
  bool sentEmail = false;

  bool checkedPhoneVerificationNum = false;
  bool checkedEmailVerificationNum = false;

  @override
  void initState() {
    super.initState();
    // nameController에 리스너 추가
    phoneVerificationNameController
        .addListener(_checkPhoneVerificationNameField);
    phoneController.addListener(_checkPhoneField);
    phoneVerificationNumController.addListener(_checkPhoneVerificationNumField);

    emailVerificationNameController
        .addListener(_checkEmailVerificationNameField);
    emailController.addListener(_checkEmailField);
    emailVerificationNumController.addListener(_checkEmailVerificationNumField);
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
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 18.h, left: 25.w),
                  child: Row(
                    children: [
                      Text(
                        '비밀번호 찾는 방법을\n선택해 주세요.',
                        style: TextStyle(
                            color: Gray2Color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
              SizedBox(height: 19.h),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 20.sp,
                            height: 20.sp,
                            child: TextButton(
                              child: Image.asset(isPhoneVerificationMode
                                  ? 'image/login/authenticationChoiceAfter.png'
                                  : 'image/login/authenticationChoiceBefore.png'),
                              onPressed: () {
                                setState(() {
                                  isPhoneVerificationMode = true;
                                  isTypingEmail = false;
                                });
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                              ),
                            )),
                        SizedBox(
                          width: 9.w,
                        ),
                        Text(
                          '휴대전화 인증',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000)),
                        )
                      ],
                    ),
                    isPhoneVerificationMode
                        ? Container(
                        height: 182.h,
                        margin: EdgeInsets.only(top: 12.h),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(right: 16.w),
                            child: SignUpTextButton(
                                width: 288.w,
                                height: 48.h,
                                autocheck: true,
                                isValid: isPhoneVerificationNameValid,
                                textEditingController:
                                phoneVerificationNameController,
                                hintText: '이름  ex) 홍길동',
                                isObscure: false),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 14.w),
                              width: 290.w,
                              height: 98.h,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000)
                                        .withOpacity(0.08),
                                    offset: Offset(4.sp, 4.sp),
                                    blurRadius: 20.sp,
                                  )
                                ],
                                borderRadius:
                                BorderRadius.circular(16.sp),
                                border: (isTypingPhone)
                                    ? Border.all(
                                    color: PrimaryColor, width: 1.sp)
                                    : Border.all(
                                    color: Color(0xffffffff),
                                    width: 0),
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
                                              fontWeight:
                                              FontWeight.w500),
                                          controller: phoneController,
                                          onTap: () {
                                            setState(() {
                                              isTypingPhone = true;
                                            });
                                          },
                                          onEditingComplete: () =>
                                          isTypingPhone = false,
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Gray2Color,
                                                fontWeight:
                                                FontWeight.w700,
                                              ),
                                              hintText:
                                              '전화번호  ex) 01012345678',
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.only(
                                                  left: 17.w,
                                                  top: 15.5.h),
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
                                                  padding:
                                                  EdgeInsets.only(
                                                      right: 7.w),
                                                  child:
                                                  isPhoneValidationNumCorrect
                                                      ? Container(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                        15.h,
                                                        right: 10.w),
                                                    child:
                                                    Text(
                                                      '인증완료',
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: Gray2Color,
                                                          fontWeight: FontWeight.w700),
                                                    ),
                                                  )
                                                      : TextButton(
                                                    onPressed:
                                                        () async {
                                                      // TODO: 전화번호 인증 api

                                                      setState(
                                                              () {
                                                            sentMessage =
                                                            true;
                                                            checkedPhoneVerificationNum =
                                                            false;
                                                            isPhoneValidationNumCorrect =
                                                            false;
                                                            phoneVerificationNumController.text =
                                                            '';
                                                          });
                                                    },
                                                    child: !sentMessage
                                                        ? Text(
                                                      '인증번호 받기',
                                                      style: TextStyle(fontSize: 13.sp, color: isPhoneValid ? SecondaryLColor : Gray2Color, fontWeight: FontWeight.w700),
                                                    )
                                                        : Text(
                                                      '인증번호 다시 받기',
                                                      style: TextStyle(fontSize: 13.sp, color: SecondaryLColor, fontWeight: FontWeight.w700),
                                                    ),
                                                    style: TextButton
                                                        .styleFrom(
                                                      minimumSize:
                                                      Size.zero,
                                                      padding:
                                                      EdgeInsets.zero,
                                                      tapTargetSize:
                                                      MaterialTapTargetSize.shrinkWrap,
                                                    ),
                                                  ))),
                                          showCursor: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                      thickness: 0.5.sp,
                                      height: 0,
                                      color: Color(0xff000000)
                                          .withOpacity(0.1)),
                                  Container(
                                    width: 288.w,
                                    height: 48.h,
                                    child: TextField(
                                      style: TextStyle(
                                          color: TextBodyColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                      controller:
                                      phoneVerificationNumController,
                                      onTap: () {
                                        setState(() {
                                          isTypingPhone = true;
                                        });
                                      },
                                      onEditingComplete: () =>
                                      isTypingPhone = false,
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
                                        suffixIcon:
                                        !isPhoneValidationNumCorrect
                                            ? Container(
                                            height: 48.h,
                                            padding:
                                            EdgeInsets.only(
                                                right: 7.w),
                                            child: TextButton(
                                                onPressed:
                                                    () async {
                                                  // TODO: 인증번호 일치 여부 확인
                                                  setState(() {
                                                    isPhoneValidationNumCorrect =
                                                    true;
                                                    checkedPhoneVerificationNum =
                                                    true;
                                                  });
                                                },
                                                child: Text(
                                                  '인증하기',
                                                  style: TextStyle(
                                                      fontSize:
                                                      13.sp,
                                                      color: isPhoneValidationNumValid
                                                          ? SecondaryLColor
                                                          : Gray2Color,
                                                      fontWeight:
                                                      FontWeight
                                                          .w700),
                                                )))
                                            : Container(
                                            padding:
                                            EdgeInsets.only(
                                                right: 15.w),
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
                          if (sentMessage || checkedPhoneVerificationNum)
                            Container(
                                padding: EdgeInsets.only(
                                    left: 14.w, top: 10.h),
                                alignment: Alignment.centerLeft,
                                child: checkedPhoneVerificationNum
                                    ? ((isPhoneValidationNumCorrect)
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
                        ]))
                        : Container(),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 20.sp,
                            height: 20.sp,
                            child: TextButton(
                              child: Image.asset(isPhoneVerificationMode
                                  ? 'image/login/authenticationChoiceBefore.png'
                                  : 'image/login/authenticationChoiceAfter.png'),
                              onPressed: () {
                                setState(() {
                                  isPhoneVerificationMode = false;
                                  isTypingPhone = false;
                                });
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                              ),
                            )),
                        SizedBox(
                          width: 9.w,
                        ),
                        Text(
                          '이메일 인증',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000)),
                        )
                      ],
                    ),
                    !isPhoneVerificationMode
                        ? Container(
                        height: 182.h,
                        margin: EdgeInsets.only(top: 12.h),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(right: 16.w),
                            child: SignUpTextButton(
                                width: 288.w,
                                height: 48.h,
                                autocheck: true,
                                isValid: isEmailVerificationNameValid,
                                textEditingController:
                                emailVerificationNameController,
                                hintText: '이름  ex) 홍길동',
                                isObscure: false),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 14.w),
                              width: 290.w,
                              height: 98.h,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000)
                                        .withOpacity(0.08),
                                    offset: Offset(4.sp, 4.sp),
                                    blurRadius: 20.sp,
                                  )
                                ],
                                borderRadius:
                                BorderRadius.circular(16.sp),
                                border: (isTypingEmail)
                                    ? Border.all(
                                    color: PrimaryColor, width: 1.sp)
                                    : Border.all(
                                    color: Color(0xffffffff),
                                    width: 0),
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
                                              fontWeight:
                                              FontWeight.w500),
                                          controller: emailController,
                                          onTap: () {
                                            setState(() {
                                              isTypingEmail = true;
                                            });
                                          },
                                          onEditingComplete: () =>
                                          isTypingEmail = false,
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Gray2Color,
                                                fontWeight:
                                                FontWeight.w700,
                                              ),
                                              hintText:
                                              '이메일  ex) abc123@naver.com',
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.only(
                                                  left: 17.w,
                                                  top: 15.5.h),
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
                                                  padding:
                                                  EdgeInsets.only(
                                                      right: 7.w),
                                                  child: isEmailValidationNumCorrect
                                                      ? Container(
                                                    padding: EdgeInsets.only(
                                                        top: 15
                                                            .h,
                                                        right: 10
                                                            .w),
                                                    child: Text(
                                                      '인증완료',
                                                      style: TextStyle(
                                                          fontSize: 13
                                                              .sp,
                                                          color:
                                                          Gray2Color,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                    ),
                                                  )
                                                      : TextButton(
                                                      onPressed: () {
                                                        // TODO: 이메일 인증 api

                                                        setState(
                                                                () {
                                                              sentEmail =
                                                              true;
                                                              checkedEmailVerificationNum =
                                                              false;
                                                              isEmailValidationNumCorrect =
                                                              false;
                                                              emailVerificationNumController.text =
                                                              '';
                                                            });
                                                      },
                                                      child: !sentEmail
                                                          ? Text(
                                                        '인증번호 받기',
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            color: isEmailValid ? SecondaryLColor : Gray2Color,
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
                                      color: Color(0xff000000)
                                          .withOpacity(0.1)),
                                  Container(
                                    width: 288.w,
                                    height: 48.h,
                                    child: TextField(
                                      style: TextStyle(
                                          color: TextBodyColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                      controller:
                                      emailVerificationNumController,
                                      onTap: () {
                                        setState(() {
                                          isTypingEmail = true;
                                        });
                                      },
                                      onEditingComplete: () =>
                                      isTypingEmail = false,
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
                                        suffixIcon:
                                        !isEmailValidationNumCorrect
                                            ? Container(
                                            height: 48.h,
                                            padding:
                                            EdgeInsets.only(
                                                right: 7.w),
                                            child: TextButton(
                                                onPressed:
                                                    () async {
                                                  // TODO: 인증번호 일치 여부 확인
                                                },
                                                child: Text(
                                                  '인증하기',
                                                  style: TextStyle(
                                                      fontSize:
                                                      13.sp,
                                                      color: isEmailValidationNumValid
                                                          ? SecondaryLColor
                                                          : Gray2Color,
                                                      fontWeight:
                                                      FontWeight
                                                          .w700),
                                                )))
                                            : Container(
                                            padding:
                                            EdgeInsets.only(
                                                right: 15.w),
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
                          if (sentEmail || checkedEmailVerificationNum)
                            Container(
                                padding: EdgeInsets.only(
                                    left: 14.w, top: 10.h),
                                alignment: Alignment.centerLeft,
                                child: checkedEmailVerificationNum
                                    ? ((isEmailValidationNumCorrect)
                                    ? Text('이메일 인증 완료',
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
                        ]))
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: 288.w,
              height: 48.h,
              margin: EdgeInsets.only(bottom: 30.h),
              // padding: EdgeInsets.only(left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: PrimaryColor,
                // Color(0xffDDDDDD),
                borderRadius: BorderRadius.circular(24.sp), boxShadow: [
                BoxShadow(
                    offset: Offset(4.sp, 4.sp),
                    color: Color(0xff000000).withOpacity(0.08),
                    blurRadius: 20.sp)
              ],),
              child: TextButton(
                child: Text(
                  '확인',
                  style: TextStyle(
                      color: WhiteColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  Get.to(ResetPwPage());

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
          ),
        ],
      ),
    );
  }
  void _checkPhoneVerificationNameField() {
    if (phoneVerificationNameController.text.isNotEmpty)
      setState(() {
        isPhoneVerificationNameValid = true;
      });
    else
      setState(() {
        isPhoneVerificationNameValid = false;
      });
  }

  void _checkEmailVerificationNameField() {
    if (emailVerificationNameController.text.isNotEmpty)
      setState(() {
        isEmailVerificationNameValid = true;
      });
    else
      setState(() {
        isEmailVerificationNameValid = false;
      });
  }

  void _checkPhoneField() {
    if (phoneController.text.length >= 10 && phoneController.text.length <= 11)
      setState(() {
        isPhoneValid = true;
      });
    else
      setState(() {
        isPhoneValid = false;
      });
  }

  void _checkEmailField() {
    // TODO: 이메일 형식 체크
    if (emailController.text.isNotEmpty)
      setState(() {
        isEmailValid = true;
      });
    else
      setState(() {
        isEmailValid = false;
      });
  }

  void _checkPhoneVerificationNumField() {
    if (phoneVerificationNumController.text.isNotEmpty)
      setState(() {
        isPhoneValidationNumValid = true;
      });
    else
      setState(() {
        isPhoneValidationNumValid = false;
      });
  }

  void _checkEmailVerificationNumField() {
    if (emailVerificationNumController.text.isNotEmpty)
      setState(() {
        isEmailValidationNumValid = true;
      });
    else
      setState(() {
        isEmailValidationNumValid = false;
      });
  }
}

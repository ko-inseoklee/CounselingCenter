import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/view/SignUp/CheckTermsOfService.dart';
import 'package:online_counseling_center/view/customWidget/SignUpTextbox.dart';

import '../../ignore.dart';

class SignUpNicknamePage extends StatefulWidget {
  Map<String,dynamic> user;
  SignUpNicknamePage({Key? key,required this.user}) : super(key: key);

  @override
  _SignUpNicknamePageState createState() => _SignUpNicknamePageState();
}

class _SignUpNicknamePageState extends State<SignUpNicknamePage> {
  TextEditingController nicknameController = TextEditingController();

  bool isNicknameValid = false;
  bool checkedDuplicateNick = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init user => {name : ${widget.user["name"]}, phoneNumber : ${widget.user["phoneNumber"]}, email :  ${widget.user["id"]}, password : ${widget.user["password"]}}");
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
                '넉넉에서 사용하실\n닉네임을 만들어주세요.',
                style: TextStyle(
                    color: Gray2Color,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              )),
          Container(
            padding: EdgeInsets.only(top: 28.h, left: 16.w, right: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: ScreenUtil.defaultSize.height - (213.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SignUpTextButton(
                            width: 288.w,
                            height: 48.h,
                            autocheck: true,
                            isValid: isNicknameValid,
                            textEditingController: nicknameController,
                            hintText: '닉네임', isObscure: false,),
                        SizedBox(height: 10.h),
                        Container(
                          width: 320.w,
                          padding: EdgeInsets.only(left: 17.w, right: 17.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (!checkedDuplicateNick)
                                  ? Text('')
                                  : (isNicknameValid
                                      ? Text('사용가능한 닉네임입니다.',
                                          style: TextStyle(
                                              color: SecondaryLColor,
                                              fontSize: 9.sp))
                                      : Text('이미 사용중인 닉네임입니다.',
                                          style: TextStyle(
                                              color: AlertRedColor,
                                              fontSize: 9.sp))),
                              TextButton(
                                child: Text(
                                    isNicknameValid ? '중복확인 완료' : '중복확인',
                                    style: TextStyle(
                                        color: isNicknameValid
                                            ? Gray2Color
                                            : SecondaryLColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700)),
                                onPressed: () async{

                                  dio.Response response = await dio.Dio().get("$apiServer/user/check-nickname?nickname=${nicknameController.text}");
                                  isNicknameValid = response.data;

                                  if (nicknameController.text.isNotEmpty &&
                                      !isNicknameValid) {
                                    setState(() {
                                      checkedDuplicateNick = true;
                                    });
                                  }
                                  checkNickField();
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
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
                            color: (isNicknameValid)
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
                            if (isNicknameValid) {
                              widget.user["nickname"] = nicknameController.text;
                              Get.to(CheckTermsOfService(user: widget.user,));

                            }
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => (isNicknameValid)
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
      ),
    );
  }

  void checkNickField() {
    if (nicknameController.text.isNotEmpty) {
      // TODO: 닉네임 중복확인

      setState(() {
        isNicknameValid = true;
      });
    } else
      setState(() {
        isNicknameValid = false;
      });
  }
}

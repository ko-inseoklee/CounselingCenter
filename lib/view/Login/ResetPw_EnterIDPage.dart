import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';

import 'package:online_counseling_center/dummy/emailDomainData.dart';
import 'package:online_counseling_center/view/Login/ResetPw_AuthenticatePage.dart';
import 'package:online_counseling_center/view/customWidget/SignUpTextbox.dart';
import 'package:get/get.dart';

class ResetPw_EnterIDPage extends StatefulWidget {
  const ResetPw_EnterIDPage({Key? key}) : super(key: key);

  @override
  State<ResetPw_EnterIDPage> createState() => _ResetPw_EnterIDPageState();
}

class _ResetPw_EnterIDPageState extends State<ResetPw_EnterIDPage> {
  TextEditingController idController = TextEditingController();

  var selectedValue = 'naver.com';
  bool isIdFilled = false;

  @override
  void initState() {
    super.initState();
    idController.addListener(checkIdField);
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
                          '찾을 아이디를\n입력해 주세요.',
                          style: TextStyle(
                              color: Gray2Color,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 16.w, top: 18.h),
                  child: Row(children: [
                    SignUpTextButton(
                      width: 130.w,
                      height: 48.h,
                      autocheck: false,
                      isValid: false,
                      textEditingController: idController,
                      hintText: '아이디',
                      isObscure: false,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 8.w, right: 8.w),
                        child: Text('@',
                            style:
                                TextStyle(fontSize: 12.sp, color: Gray2Color))),
                    Container(
                      width: 130.w,
                      height: 48.h,
                      padding:
                          EdgeInsets.only(top: 5.h, left: 12.w, right: 16.w),
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
                            color: TextBodyColor,
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
                ),
              ]),
              Container(
                width: 288.w,
                height: 48.h,
                margin: EdgeInsets.only(bottom: 30.h),
                decoration: BoxDecoration(
                  color: isIdFilled ? PrimaryColor : Color(0xffDDDDDD),
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
                    // TODO: 아이디가 유저 DB에 있는지 확인

                    Get.to(ResetPw_AuthenticatePage());
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) =>
                        isIdFilled ? PrimaryVariant3Color : Color(0xffDDDDDD)),
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

  void checkIdField() {
    if (idController.text.isNotEmpty) {
      setState(() {
        isIdFilled = true;
      });
    } else
      setState(() {
        isIdFilled = false;
      });
  }


}

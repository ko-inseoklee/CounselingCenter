import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';

class SignUpTextButton extends StatefulWidget {
  double width;
  double height;
  bool autocheck = false;
  bool isValid = false;
  String hintText = '';
  bool isObscure;
  TextEditingController textEditingController = TextEditingController();

  SignUpTextButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.autocheck,
      required this.isValid,
      required this.textEditingController,
      required this.hintText,
      required this.isObscure})
      : super(key: key);

  @override
  _SignUpTextButtonState createState() => _SignUpTextButtonState();
}

class _SignUpTextButtonState extends State<SignUpTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
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
        child: TextField(
            // textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                color: TextBodyColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700),
            // textAlignVertical: TextAlignVertical.center,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 12.sp,
                color: Gray2Color,
                fontWeight: FontWeight.w700,
              ),
              hintText: widget.hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 17.w, top: 15.5.h),
              suffixIcon: widget.isValid
                  ? Container(
                      padding: EdgeInsets.only(right: 12.w),
                      width: 24.w,
                      height: 48.h,
                      child: Image.asset('image/signUpCheckIcon.png'))
                  : Container(width: 24.w),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PrimaryColor, width: 1.sp),
                borderRadius: BorderRadius.all(Radius.circular(16.sp)),
              ),
            ),
            showCursor: false,
            obscureText: widget.isObscure));
  }
}

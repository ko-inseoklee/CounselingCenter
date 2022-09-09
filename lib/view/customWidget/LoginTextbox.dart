import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_counseling_center/color.dart';

class LoginTextBox extends StatefulWidget {
  double width;
  double height;
  String hintText = '';
  bool isObscure = false;
  bool isEmpty = false;
  TextEditingController textEditingController;

  LoginTextBox(
      {Key? key,
      required this.width,
      required this.height,
      required this.textEditingController,
      required this.hintText,
      required this.isObscure,
      required this.isEmpty})
      : super(key: key);

  @override
  _LoginTextBoxState createState() => _LoginTextBoxState();
}

class _LoginTextBoxState extends State<LoginTextBox> {
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
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: TextField(
          controller: widget.textEditingController,
            style: TextStyle(
                color: TextBodyColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: Gray2Color,
                fontWeight: FontWeight.w700,
              ),
              hintText: widget.hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 17.w, top: 14.h),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PrimaryColor, width: 1.sp),
                borderRadius: BorderRadius.all(Radius.circular(16.sp)),
              ),
              suffixIcon:
              !widget.isEmpty
                  ?
              Container(
                      padding: EdgeInsets.only(right: 16.w),
                      width: 32.w,
                      height: 48.h,
                      child: TextButton(
                        child: Image.asset(
                          'image/login/deleteIcon.png',
                          width: 16.w,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.textEditingController.clear();
                            // print('delete button clicked!');
                          });
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    )
                  : Container(width: 32.w),
            ),
            showCursor: false,
            obscureText: widget.isObscure));
  }
}

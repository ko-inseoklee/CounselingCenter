import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  int _pageIndex = 0;

  DefaultAppBar({Key? key, required int pageIndex}) {
    _pageIndex = pageIndex;
  }

  @override
  Size get preferredSize => Size.fromHeight(89.h);

  @override
  PreferredSizeWidget build(BuildContext context) {
    bool isMain = (_pageIndex == 0);

    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.sp),
              bottomRight: Radius.circular(30.sp))),
      backgroundColor: isMain ? PrimaryColor : Color(0xffffffff),
      leading: Container(
        child: Image.asset("image/mainLogo.png",
            width: 43.w,
            height: 25.h,
            color: isMain ? Color(0xffffffff) : PrimaryColor),
      ),
      elevation: isMain ? 4.sp : 10.sp,
      shadowColor: isMain ? Color(0xffBC9A3140) : Color(0xff000000).withOpacity(0.04),
      actions: [
        Center(
          child: Container(
            width: 180.w,
            height: 26.h,
            child: TextField(
                decoration: InputDecoration(
              hintText: '키워드 입력',
              hintStyle: isMain
                  ? TextStyle(
                      color: PrimaryVariantLColor,
                      fontSize: 12.sp,
                    )
                  : TextStyle(
                      color: PrimaryColor,
                      fontSize: 12.sp,
                    ),
              focusedBorder: isMain
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: PrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(37),
                    ),
              enabledBorder: isMain
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: PrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(37),
                    ),
              contentPadding: EdgeInsets.only(left: 12.w, bottom: 4.h),
              suffixIcon: IconButton(
                icon: ImageIcon(
                  AssetImage("image/searchIcon.png"),
                  color: isMain ? PrimaryVariantLColor : PrimaryColor,
                ),
                onPressed: () {},
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            )),
            decoration: BoxDecoration(
              color: isMain
                  ? Color(0xffFFFFFF).withOpacity(0.85)
                  : Color(0xffFFFFFF).withOpacity(0.5),
              borderRadius: BorderRadius.circular(37),
            ),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 34.h),
          child: IconButton(
            icon: Image.asset("image/bellIcon.png", color: isMain ? Color(0xffFFFFFF) : PrimaryColor),
            onPressed: () {},
            iconSize: 15.sp,
          ),
        ),
        Container(
          // margin: EdgeInsets.only(left: 11.88),
          child: IconButton(
            icon: Image.asset("image/menuIcon.png", color: isMain ? Color(0xffFFFFFF) : PrimaryColor),
            onPressed: () {},
            iconSize: 13.sp,
          ),
        )
      ],
    );
  }
}
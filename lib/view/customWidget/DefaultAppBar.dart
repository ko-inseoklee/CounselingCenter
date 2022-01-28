import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(89.h);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading:
          Container(
        // margin: EdgeInsets.only(top: 51/4.h, left: 22/4.w),
        child: Image.asset(
          "image/mainLogo.png",
          width: 43.w,
          height: 25.h
        ),
      ),
      actions: [
        Container(
          width: 180.w,
          height: 26.h,
          // margin: EdgeInsets.only(top: 28.h),
          child: Text('키워드 입력', style: TextStyle(color: PrimaryVariant1Color,)),
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF).withOpacity(0.85),
            borderRadius: BorderRadius.circular(37),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 34.h),
          child: IconButton(
            icon: Image.asset("image/bellIcon.png", color: Color(0xffFFFFFF)),
            onPressed: () {},
            iconSize: 15.sp,
          ),
        ),
        Container(
          // margin: EdgeInsets.only(left: 11.88),
          child: IconButton(
            icon: Image.asset("image/menuIcon.png", color: Color(0xffFFFFFF)),
            onPressed: () {},
            iconSize: 13.sp,
          ),
        )
      ],
    );
  }
}

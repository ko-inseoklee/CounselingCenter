import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../color.dart';

class BoardAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String title;
  const BoardAppBar({Key? key,required this.title}) : super(key: key);

  @override
  _BoardAppBarState createState() => _BoardAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(64);
}

class _BoardAppBarState extends State<BoardAppBar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.sp),
              bottomRight: Radius.circular(30.sp))),
      backgroundColor: Colors.white,
      leading: TextButton.icon(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.arrow_back,color: PrimaryColor,), label: Text('')),
      centerTitle: true,
      title: Text(widget.title,style: TextStyle(color: Colors.black),),
      actions: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: TextButton(
                      child: Image.asset(
                        "image/searchIcon.png",
                        width: 16.sp,
                        height: 16.sp,
                        color: PrimaryColor,
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                    )
                ),
                Container(
                  padding: EdgeInsets.only(left: 14.w),
                  child: TextButton(
                    child: Image.asset("image/bellIcon.png",
                        color: PrimaryColor,
                        width: 16.sp,
                        height: 16.sp),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 14.w, right: 18.w),
                  child: TextButton(
                    child: Image.asset(
                      "image/menuIcon.png",
                      color: PrimaryColor,
                      width: 13.sp,
                      height: 10.95.sp,
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

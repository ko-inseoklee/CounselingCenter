import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/model/match.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  int _pageIndex = 0;

  DefaultAppBar({Key? key, required int pageIndex, bool? isExpanded}) {
    _pageIndex = pageIndex;
    isExpanded = isExpanded;
  }

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => (_pageIndex == 0 || _pageIndex == 1) ? Size.fromHeight(53.h) : Size.fromHeight(99.45.h);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  bool isExpanded = false;

  String pageTitle = '';

  // @override
  // Size get preferredSize =>
  //     (widget._pageIndex == 0 || widget._pageIndex == 1) ? Size.fromHeight(53.h) : Size.fromHeight(99.45.h);

  @override
  PreferredSizeWidget build(BuildContext context) {
    bool isMain = (widget._pageIndex == 0);
    pageTitle = (widget._pageIndex == 1
        ? '게시판'
        : (widget._pageIndex == 2 ? '매칭하기' : (widget._pageIndex == 4 ? '꿀팁' : '')));

    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: isMain ? Color(0xffBC9A31).withOpacity(0.25): Color(0xff000000).withOpacity(0.04),
                offset: Offset(0, 4.sp),
                blurRadius: isMain ? 4.sp : 10.sp,
              )
            ]),
            child: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.sp),
                        bottomRight: Radius.circular(30.sp))),
                backgroundColor: isMain ? PrimaryColor : Color(0xffffffff),
                elevation: isMain ? 4.sp : 10.sp,
                // shadowColor: isMain
                //     ? Color(0xffBC9A3140)
                //     : Color(0xff000000).withOpacity(0.04),
                centerTitle: true,
                title: !isMain
                    ? Text(
                        pageTitle,
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      )
                    : Container(),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (isMain)
                        Container(
                          // margin: EdgeInsets.only(left: 11.w),
                          child: Image.asset(
                            "image/mainLogo.png",
                            fit: BoxFit.fill,
                            color: Color(0xffffffff),
                            width: 43.w,
                            height: 25.01.h,
                          ),
                        ),
                      SizedBox(width: 11.w),
                      if (isMain)
                        Container(
                          constraints: BoxConstraints(minWidth: 177.w),
                          width: 177.w,
                          height: 26.h,
                          child: TextFormField(
                              decoration: InputDecoration(
                            // hintText: '키워드 입력',
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
                                    borderSide: BorderSide(
                                        color: PrimaryColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(37.sp),
                                  ),
                            enabledBorder: isMain
                                ? InputBorder.none
                                : OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: PrimaryColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(37.sp),
                                  ),
                            contentPadding:
                                EdgeInsets.only(left: 12.w, bottom: 4.h),
                            prefixIcon: IconButton(
                              icon: ImageIcon(
                                AssetImage("image/searchIcon.png"),
                                color: isMain
                                    ? PrimaryVariantLColor
                                    : PrimaryColor,
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
                      // ),
                      // ),
                      Container(
                        // width: 87.w,
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            !isMain
                                ? Container(
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
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                                    onPressed: () {},
                                  ))
                                : Container(),
                            Container(
                              padding: EdgeInsets.only(left: 14.w),
                              child: TextButton(
                                child: isMain
                                    ? Image.asset("image/bellIcon.png",
                                        color: Color(0xffFFFFFF),
                                        width: 15.sp,
                                        height: 15.sp)
                                    : Image.asset("image/bellIcon.png",
                                        color: PrimaryColor,
                                        width: 16.sp,
                                        height: 16.sp),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 14.w, right: 18.w),
                              child: TextButton(
                                child: Image.asset(
                                  "image/menuIcon.png",
                                  color: isMain
                                      ? Color(
                                          0xffFFFFFF,
                                        )
                                      : PrimaryColor,
                                  width: 13.sp,
                                  height: 10.95.sp,
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                bottom: PreferredSize(
                    preferredSize: (isMain || widget._pageIndex == 1) ? Size.zero : Size.fromHeight(59),
                    child: (isMain || widget._pageIndex == 1)
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160.w,
                                height: 55.h,
                                child: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            matchTab1 = true;
                                            print(matchTab1);
                                          });
                                        },
                                        child: Text('전체 매칭방',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff333333)))),
                                    Center(
                                        child: Divider(
                                      thickness: 3.sp,
                                      height: 0,
                                      color: matchTab1 ? PrimaryColor : Colors.white,
                                      indent: 65.w,
                                      endIndent: 65.w,
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                width: 160.w,
                                height: 55.h,
                                child: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            matchTab1 = false;
                                            print(matchTab1);
                                          });
                                        },
                                        child: Text('참여 매칭방',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff333333)))),
                                    Center(
                                        child: Divider(
                                          thickness: 3.sp,
                                          height: 0,
                                          color: matchTab1 ? Colors.white : PrimaryColor,
                                          indent: 65.w,
                                          endIndent: 65.w,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          )))));
  }
}



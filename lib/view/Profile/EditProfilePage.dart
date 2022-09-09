import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_counseling_center/color.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? profileImage;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(51.h),
        child: Container(
          padding: EdgeInsets.only(top: 13.45.h),
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
              '프로필 수정',
              style: TextStyle(
                  color: TextBodyColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      body: Container(
        width: 320.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: 80.sp,
              height: 80.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: (profileImage == null)
                    ? DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('image/generations/profile.png'))
                    : DecorationImage(
                        fit: BoxFit.fill,
                        image: FileImage(File(profileImage!.path))),
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            TextButton(
              onPressed: () {
                openBottomSheet();
              },
              child: Text(
                '프로필 이미지 바꾸기',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: SecondaryLColor),
              ),
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
                width: 291.w,
                height: 98.h,
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
                  // border: (isTyping)
                  //     ? Border.all(color: PrimaryColor, width: 1.sp)
                  //     : Border.all(
                  //     color: Color(0xffffffff), width: 0),
                ),
                child: Column(
                  children: [
                    Container(
                        width: 288.w,
                        height: 48.h,
                        padding: EdgeInsets.only(left: 17.w, right: 29.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '닉네임 변경',
                              style: TextStyle(
                                  color: TextBodyColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              '춤추는 할배',
                              style: TextStyle(
                                  color: Gray2Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp),
                            )
                          ],
                        )),
                    Divider(
                        thickness: 0.5.sp,
                        height: 0,
                        color: Color(0xff000000).withOpacity(0.1)),
                    Container(
                        width: 288.w,
                        height: 48.h,
                        padding: EdgeInsets.only(left: 17.w, right: 29.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '내 키워드 변경',
                                style: TextStyle(
                                    color: TextBodyColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                              Text(
                                '#60대',
                                style: TextStyle(
                                    color: Gray2Color,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp),
                              )
                            ])),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 242.h,
        child: Column(
          children: [
            SizedBox(height: 14.h),
            Row(
              children: [
                SizedBox(
                  width: 113.w,
                ),
                Text(
                  '이미지 가져오기',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: TextBodyColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 73.w,
                ),
                Container(
                  width: 24.w,
                  child: TextButton(
                    child: Image.asset(
                      'image/closeIcon.png',
                      color: TextBodyColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: 320.w,
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                children: [
                  Container(
                    width: 288.w,
                    height: 48.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: TextButton(
                      child: Text(
                        '갤러리',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: WhiteColor),
                      ),
                      onPressed: () async {
                        var status = await Permission.photos.status;
                        if (status.isGranted) {
                          print('갤러리 권한 허락됨');
                          getImage(ImageSource.gallery);
                          Get.back();
                        } else if (status.isDenied) {
                          print('갤러리 권한 거절됨');
                          Permission.photos.request(); // 허락해달라고 팝업띄우는 코드

                          Get.back();
                        }
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => PrimaryVariant3Color),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.sp),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size.fromHeight(
                            ScreenUtil().setWidth(288.w),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffffffff).withOpacity(0.08),
                              offset: Offset(4, 4),
                              blurRadius: 20.sp)
                        ],
                        borderRadius: BorderRadius.circular(24.sp)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 288.w,
                    height: 48.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: TextButton(
                      child: Text(
                        '기본 프로필',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: WhiteColor),
                      ),
                      onPressed: () {
                        setState(() {
                          profileImage = null;
                        });
                        Get.back();
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => PrimaryVariant3Color),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.sp),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size.fromHeight(
                            ScreenUtil().setWidth(288.w),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffffffff).withOpacity(0.08),
                              offset: Offset(4, 4),
                              blurRadius: 20.sp)
                        ],
                        borderRadius: BorderRadius.circular(24.sp)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 288.w,
                    height: 48.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: TextButton(
                      child: Text(
                        '사진 촬영',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: WhiteColor),
                      ),
                      onPressed: () async {
                        var status = await Permission.camera.status;
                        if (status.isGranted) {
                          print('카메라 권한 허락됨');
                          getImage(ImageSource.camera);
                          Get.back();
                        } else if (status.isDenied) {
                          print('카메라 권한 거절됨');
                          Permission.camera.request(); // 허락해달라고 팝업띄우는 코드
                          if (status.isGranted) {
                            print('카메라 권한 허락됨');
                            getImage(ImageSource.camera);
                            Get.back();
                          }
                        }
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => GrayButtonDown),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.sp),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size.fromHeight(
                            ScreenUtil().setWidth(288.w),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Gray3Color,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffffffff).withOpacity(0.08),
                              offset: Offset(4, 4),
                              blurRadius: 20.sp)
                        ],
                        borderRadius: BorderRadius.circular(24.sp)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              24.sp,
            ),
            topRight: Radius.circular(
              24.sp,
            )),
      ),
    );
  }

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      profileImage = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/color.dart';
import 'package:online_counseling_center/model/user/user.dart';
import 'package:online_counseling_center/view/Login/GetAdditionalUserInfo.dart';

import 'DefaultAB.dart';

class CheckTermsOfService extends StatefulWidget {
  CheckTermsOfService({Key? key}) : super(key: key);

  @override
  _CheckTermsOfServiceState createState() => _CheckTermsOfServiceState();
}

class _CheckTermsOfServiceState extends State<CheckTermsOfService> {
  bool checked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAB(
        title: '회원가입',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                width: 163.w,
                height: 56,
                margin: EdgeInsets.only(top: 28,left: 22.w),
                child: Text('넉넉을 이용하려면 동의가 꼭 필요해요.',style: TextStyle(color: Color(0xffCCCCCC), fontSize: 20.sp,fontWeight: FontWeight.w500),),
              ),
              Container(
                margin: EdgeInsets.only(left: 16.w,top: 56,right: 16.w),
                width: 288.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff000000).withOpacity(0.08),
                          blurRadius: 20.sp,
                          offset: Offset(4.sp, 4.sp))
                    ]
                  // color: Colors.grey
                ),
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.dialog(termsOfService());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 12.w),
                            child: checked? Image.asset('image/login/getAdditionalInfo/fi_check-square.png', width: 24, height: 24,) : Image.asset('image/login/getAdditionalInfo/fi_minus-square.png',width: 24, height: 24,),
                          ),
                          Container(
                            width: 120.w,
                            margin: EdgeInsets.only(left: 9.w),
                            child: Text("개인정보 활용 동의", style: TextStyle(fontSize: 12.sp,color: Color(0xffCCCCCC)),),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 17.w),
                        child: ButtonTheme(
                          padding: EdgeInsets.zero,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Get.dialog(termsOfService());
                            },
                          child: Text('보기', style: TextStyle(fontSize: 13.sp,color: checked? Color(0xffCCCCCC) : Color(0xff00B9FF)),),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 16.w,right: 16.w, bottom: 30),
            width: 288.w,
            height: 48.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.h),
                color: checked? PrimaryColor : Color(0xffDDDDDD),
              // color: Colors.grey
            ),
            child: FlatButton(
              onPressed: () {
                //TODO: 여기도 유저로 넘어와야 함.
                Map<String,dynamic> user = {
                  "id" : "tjrkd222",
                  "password" : "1234",
                  "uid" : "1234",
                };
                if(checked) Get.to(GetAdditionalInfoPage(user: user,));
              },
              child: Text('다음',style: TextStyle(fontSize: 14.sp,color: Colors.white, fontWeight: FontWeight.w700),),
            ),
          )
        ],
      ),
    );
  }

  Widget termsOfService(){
    return AlertDialog(
      title: Text("이용약관"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: Container(
        width: 288.w,
        height: 400,
        child: Column(
          children: [
            Text('이용약관 입니다.',style: TextStyle(color: Colors.black),),
            FlatButton(onPressed: (){
              setState(() {
                checked = true;
              });
              Get.back();
            }, child: Text('전체 동의하기'))
          ],
        ),
      ),
    );
  }
}

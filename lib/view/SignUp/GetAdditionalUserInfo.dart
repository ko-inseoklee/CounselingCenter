import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/ignore.dart';
import 'package:online_counseling_center/model/user/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../color.dart';
import '../Login/DefaultAB.dart';

class GetAdditionalInfoPage extends StatefulWidget {
  Map<String, dynamic> user;
  GetAdditionalInfoPage({Key? key, required this.user}) : super(key: key);

  @override
  _GetAdditionalInfoPageState createState() => _GetAdditionalInfoPageState();
}

class _GetAdditionalInfoPageState extends State<GetAdditionalInfoPage> {
  bool? checkBirth;
  bool? checkSex;
  bool? checkJob;
  bool? checkAll;
  String result = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkBirth = false;
    checkJob = false;
    checkSex = false;
    checkAll = checkBirth! && checkSex! && checkJob!;
    widget.user["sex"] = "";
    widget.user["birth"] = "2022";
    widget.user["job"] = "직업을 선택해주세요.";
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
                margin: EdgeInsets.only(top: 28,left: 22.w),
                child: Text('당신은 어떤 사람인가요?',style: TextStyle(fontSize: 20.sp,color: Color(0xffCCCCCC),fontWeight: FontWeight.w500),),
              ),
              Container(
                width: 288.w,
                height: 48.h,
                margin: EdgeInsets.only(top: 28,left: 22.w,right: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48.w,
                      child: Text('출생년도',style: TextStyle(color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      width: 214.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Colors.white,
                          border: Border.all(color: checkBirth!? PrimaryColor: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.08),
                                blurRadius: 20.sp,
                                offset: Offset(4.sp, 4.sp))
                          ]
                        // color: Colors.grey
                      ),
                      child: FlatButton(onPressed: () {
                        openBirthSheet();
                      },
                        child: Text(widget.user["birth"], style: TextStyle(
                          color: checkBirth!? Colors.black : Color(0xffCCCCCC)
                        ),),

                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 288.w,
                height: 48.h,
                margin: EdgeInsets.only(top: 28,left: 22.w,right: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48.w,
                      child: Text('성별',style: TextStyle(color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w,right: 8.w),
                      width: 66.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Colors.white,
                          border: Border.all(color: widget.user["sex"] == "남"? PrimaryColor: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.08),
                                blurRadius: 20.sp,
                                offset: Offset(4.sp, 4.sp))
                          ]
                      ),
                      child: FlatButton(onPressed: () {
                        setState(() {
                          widget.user["sex"] = "남";
                          checkSex = true;
                        });
                      },
                        child: Text(
                          "남",
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: widget.user["sex"] == "남" && checkSex == true? Colors.black:Color(0xffCCCCCC)),),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 66.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Colors.white,
                          border: Border.all(color: widget.user["sex"] == "여"? PrimaryColor: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.08),
                                blurRadius: 20.sp,
                                offset: Offset(4.sp, 4.sp))
                          ]
                        // color: Colors.grey
                      ),
                      child: FlatButton(onPressed: () {
                        setState(() {
                          widget.user["sex"] = "여";
                          checkSex = true;
                        });
                      },
                        child: Text(
                          "여",
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: widget.user["sex"] == "여" && checkSex == true? Colors.black:Color(0xffCCCCCC)),),),
                    ),
                    Container(
                      width: 66.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          border: Border.all(color: widget.user["sex"] == "선택안함"? PrimaryColor: Colors.white),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.08),
                                blurRadius: 20.sp,
                                offset: Offset(4.sp, 4.sp))
                          ]
                        // color: Colors.grey
                      ),
                      child: FlatButton(onPressed: () {
                        setState(() {
                          widget.user["sex"] = "선택안함";
                          checkSex = true;
                        });
                      },
                        padding: EdgeInsets.zero,
                        child: Text(
                          "선택안함",
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: widget.user["sex"] == "선택안함" && checkSex == true? Colors.black:Color(0xffCCCCCC)),),),
                    ),
                  ],
                ),
              ),
              Container(
                width: 288.w,
                height: 48.h,
                margin: EdgeInsets.only(top: 28,left: 22.w,right: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48.w,
                      child: Text('직업',style: TextStyle(color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w700),),

                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      width: 214.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Colors.white,
                          border: Border.all(color: checkJob!? PrimaryColor: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.08),
                                blurRadius: 20.sp,
                                offset: Offset(4.sp, 4.sp))
                          ]
                        // color: Colors.grey
                      ),
                      child: FlatButton(onPressed: () {
                        openJobSheet();
                      },
                      child: Text(widget.user["job"],style: TextStyle(
                        color: checkJob!? Colors.black : Color(0xffCCCCCC)
                      ),),

                      ),
                    )
                  ],
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
              color: checkAll!? PrimaryColor : Color(0xffDDDDDD),
              // color: Colors.grey
            ),
            child: FlatButton(
              onPressed: () async{
                //TODO: 회원가입
                dio.Response response = await dio.Dio().post("$apiServer/user/sign-up",data: {"email" : widget.user["id"],"name" : widget.user["name"], "phoneNumber" : widget.user["phoneNumber"],"password" : widget.user["password"], "age" : widget.user["birth"], "sex" : widget.user["sex"], "jobs" : widget.user["job"], "nickname" : widget.user["nickname"]});
                print(response.data);
                print("init user => {name : ${widget.user["name"]}, phoneNumber : ${widget.user["phoneNumber"]}, email :  ${widget.user["id"]}, password : ${widget.user["password"]}, birth: ${widget.user["birth"]}, sex : ${widget.user["sex"]}, job : ${widget.user["job"]}}");
              },
              child: Text('회원가입 완료',style: TextStyle(fontSize: 14.sp,color: Colors.white, fontWeight: FontWeight.w700),),
            ),
          )
        ],
      ),
    );
  }

  void openBirthSheet(){
    int result = 2022;

    Get.bottomSheet(
      Container(
        height: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 7.h,bottom: 8.h),
                child: Text("출생년도", style: TextStyle(color: Colors.black, fontSize: 14.sp,fontWeight: FontWeight.w700),) ,
              ),
              Container(
                height: 120,
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2.h,bottom: 2.h),
                            child: FlatButton(onPressed: () {
                              setState(() {
                                widget.user["birth"] = (2022 - index).toString();
                                result = 2022 - index;
                                checkBirth = true;
                                Get.back();
                              });
                            },
                                padding: EdgeInsets.zero,
                            child: Text("${(2022 - index)} 년",style: TextStyle(color: Colors.black,fontSize: 15.sp),)),),
                        ],
                      );
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16.w,right: 16.w, bottom: 10),
                width: 288.w,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.h),
                  color: PrimaryColor ,
                  // color: Colors.grey
                ),
                child: FlatButton(
                  onPressed: () {
                    widget.user["birth"] = result;
                    checkBirth = true;
                    Get.back();
                  },
                  child: Text('입력 완료',style: TextStyle(fontSize: 14.sp,color: Colors.white, fontWeight: FontWeight.w700),),
                ),
              )
            ],
          )
      )
    );
  }

  void openJobSheet(){
    Get.bottomSheet(
        Container(
            height: 344.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12.h,bottom: 24.h),
                  child: Text("직업", style: TextStyle(color: Colors.black, fontSize: 14.sp,fontWeight: FontWeight.w700),) ,
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 10),
                  child: Row(
                    children: [
                      jobCard("학생"),
                      jobCard("직장인"),
                      jobCard("주부"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 10),
                  child: Row(
                    children: [
                      jobCard("자영업"),
                      jobCard("사업"),
                      jobCard("프리랜서"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 10),
                  child: Row(
                    children: [
                      jobCard("종교인"),
                      jobCard("기타"),
                      jobCard("선택안함"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.w,right: 16.w, bottom: 10, top:36),
                  width: 288.w,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.h),
                    color: PrimaryColor ,
                    // color: Colors.grey
                  ),
                  child: FlatButton(
                    onPressed: () {
                      widget.user["job"] = result;
                      checkJob = true;
                      Get.back();
                    },
                    child: Text('선택 완료',style: TextStyle(fontSize: 14.sp,color: Colors.white, fontWeight: FontWeight.w700),),
                  ),
                )
              ],
            )
        )
    );
  }

  Widget jobCard(String title){
    return Container(
      width: 89.w,
      height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.h),
          color: Colors.white,
          border: Border.all(color: result == title? PrimaryColor: Colors.white),
          boxShadow: [
            BoxShadow(
                color: Color(0xff000000).withOpacity(0.08),
                blurRadius: 20.sp,
                offset: Offset(4.sp, 4.sp))
          ]
        // color: Colors.grey
      ),
      margin: EdgeInsets.only(right: 8.w),
      child: FlatButton(onPressed: () {
        setState(() {
          result = title;
          widget.user["job"] = title;
          checkJob = true;
          checkAll = checkJob! && checkBirth! && checkSex!;
        });
      },
          child: Text(title,style: TextStyle(color: result == title ? Colors.black : Color(0xffCCCCCC), fontSize: 13.sp, fontWeight: FontWeight.w700),)),
    );
  }
}

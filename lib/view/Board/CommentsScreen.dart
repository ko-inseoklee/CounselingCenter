import 'package:flutter/material.dart';
import 'package:online_counseling_center/model/board/comment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsScreen extends StatelessWidget {
  final List<Comment>? comments;
  const CommentsScreen({Key? key,required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buildComments(),
    );
  }

  List<Widget> buildComments(){
    return comments!.map((e) => buildComment(e)).toList();
  }

  Widget buildComment(Comment c){
    return Container(
      height: 90,
      padding: EdgeInsets.only(left: 18.w, right: 20, top: 4),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white
                ),
                width: 35.w,
                height: 35,
                margin: EdgeInsets.only(right: 5.w),
                child: Image.asset('image/image_3.png')
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text('${c.writerID}  ',style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black),),
                        Text(c.writtenTime,style: TextStyle(fontSize: 9.sp,color: Colors.grey),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1),
                    height: 24,
                    child: Text(c.contents, style: TextStyle(color: Colors.black,fontSize: 10.sp,)),
                  ),
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Container(
                          width: 33.w,
                          child: ButtonTheme(
                              padding: EdgeInsets.zero,
                              child: FlatButton(onPressed: (){}, child: Text('공감하기',style: TextStyle(color: Color(0xffAAAAAA),fontSize: 9.sp),)
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 14.w),
                          width: 33.w,
                          child: ButtonTheme(
                              padding: EdgeInsets.zero,
                              child: FlatButton(onPressed: (){}, child: Text('답글쓰기',style: TextStyle(color: Color(0xffAAAAAA),fontSize: 9.sp),)
                              )
                          ),
                        ),
                        Container(
                          width: 40.w,
                          margin: EdgeInsets.only(left: 14.w),
                          child: ButtonTheme(
                              padding: EdgeInsets.zero,
                              child: FlatButton(onPressed: (){}, child: Text('쪽지보내기',style: TextStyle(color: Color(0xffAAAAAA),fontSize: 9.sp),)
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 8,),
            child: Divider(
              indent: 12.w,
              endIndent: 12.w,
            ),
          ),
        ],
      ),
    );

  }
}

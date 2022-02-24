import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/model/board/comment.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';

import '../../color.dart';

class TopicInput extends StatefulWidget {
  final ValueChanged<Comment> valueChanged;
  final TodayTopic topic;

  const TopicInput({Key? key,required this.valueChanged,required this.topic}) : super(key: key);

  @override
  _TopicInputState createState() => _TopicInputState();
}

class _TopicInputState extends State<TopicInput> {
  TextEditingController textEditingController = new TextEditingController();
  bool isFull = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState){
      return Container(
        height: 314,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 288.w,
              height: 22,
              margin: EdgeInsets.only(top: 10),
              child: Text("답변하기", style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.sp
              ),),
            ),
            Container(
              alignment: Alignment.center,
              width: 288.w,
              height: 21,
              child: Text(widget.topic.date, style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13.sp
              ),),
            ),
            Container(
              alignment: Alignment.center,
              width: 288.w,
              height: 45,
              margin: EdgeInsets.only(top: 8),
              child: Text("Q. ${widget.topic.question}", style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12.sp
              ),),
            ),
            //TODO: 아이폰은 아래 키보드 안올라옴, 안드로이드에서 확인 부탁.
            Container(
              width: 288.w,
              height: 116,
              margin: EdgeInsets.only(top: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),color: Colors.white
              ),
              child: TextField(
                controller: textEditingController,
                showCursor: false,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onEditingComplete: (){
                  setState((){
                    isFull = textEditingController.text == ''? false : true;
                    Comment c = new Comment(bID: 'bID', cID: 'cID', contents: textEditingController.text, writerID: 'writerID', title: 'title', writtenTime: 'writtenTime', like: 0, re: []);
                    widget.valueChanged(c);
                  });
                },
              ),
            ),
            Container(
              width: 288.w,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: !isFull? Color(0xffAAAAAA): PrimaryColor,
              ),
              child: TextButton(onPressed: () {
                
              }, child: Text('답변 게시하기',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 14.sp),),
              ),
            )
          ],
        ),
      );
    });
  }
}

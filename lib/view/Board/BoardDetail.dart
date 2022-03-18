import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/board/board.dart';
import 'package:online_counseling_center/model/board/generalBoard.dart';
import 'package:online_counseling_center/model/board/todayTopic.dart';
import 'package:online_counseling_center/model/user/user.dart';
import 'package:online_counseling_center/view/Board/BoardAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/view/Board/CommentsScreen.dart';
import 'package:http/http.dart' as http;


import '../../color.dart';

class BoardDetail extends StatefulWidget {
  final String title;
  final GeneralBoard board;
  final bool isTodayTopic;
  final TodayTopic todayTopic;
  const BoardDetail({Key? key,required this.title,required this.board,required this.isTodayTopic,required this.todayTopic}) : super(key: key);

  @override
  _BoardDetailState createState() => _BoardDetailState();
}

class _BoardDetailState extends State<BoardDetail> {
  TextEditingController _controller = new TextEditingController();

  //TEST DATA
  User user = user_me;

  late TodayTopic test;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BoardAppBar(title: widget.title,),
      body: Column(
        children: [
          TextButton(onPressed: () async {
            var client = http.Client();
            try{
              var url = Uri.parse('http://35.216.20.238:8080/today-topic/20220318');
              var response = await client.get(url);
              var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
              // Board board = new Board.fromJson(decodedResponse);
              decodedResponse.forEach((key, value) {
                print("key = $key, val = $value");
              });




              var response2 = await Dio().get('http://35.216.20.238:8080/today-topic/20220318');
              print(response2);
            } finally{
              client.close();
            }
          }, child: Text("test")),
          Container(
            height: 260,
            padding: EdgeInsets.only(left: 16.w, top: 18, right: 16.w),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: Text('MANAGER',style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp
                      ),),),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: IconButton(onPressed: () {  }, icon: Icon(Icons.more_vert_outlined,color: PrimaryColor,),),
                            ),
                            Container(child: Text('4시간 전',style: TextStyle(fontSize: 12.sp, color: Colors.grey),),)
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(top: 13),
                  alignment: Alignment.centerLeft,
                  child: Text(widget.todayTopic.title,style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w700), ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 7),
                  height: 76,
                  alignment: Alignment.topLeft,
                  child: Text(widget.todayTopic.question,style: TextStyle(fontSize: 13.sp, color: Colors.black), ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 13, bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 98.w,
                        height: 30,
                        child: ButtonTheme(
                          padding: EdgeInsets.zero,
                          child: FlatButton(
                            onPressed: () {  },
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border),
                                Container(
                                  padding: EdgeInsets.only(left: 4.w)
                                ,child: Text('공감하기 ${widget.todayTopic.likes.toString()}',style: TextStyle(fontSize: 13.sp),)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 98.w,
                        height: 30,
                        child: ButtonTheme(
                          padding: EdgeInsets.zero,
                          child: FlatButton(
                            onPressed: () {  },
                            child: Row(
                              children: [
                                Icon(Icons.chat_bubble_outline),
                                Container(
                                    padding: EdgeInsets.only(left: 4.w)
                                    ,child: Text('댓글 ${widget.todayTopic.comments!.length.toString()}',style: TextStyle(fontSize: 13.sp),)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // height: 254,
            //   padding: EdgeInsets.only(top: 10),
              child: CommentsScreen(comments: widget.todayTopic.comments,)
          ),
        ],
      ),
      bottomSheet: Container(
        height: 73,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 32,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250.w,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black
                    ),
                    controller: _controller,
                    showCursor: false,
                    decoration: InputDecoration(
                        fillColor: Color(0xffE5E5E5),
                        filled: true,
                        contentPadding: EdgeInsets.only(left: 10.w),
                        hintText: '댓글을 입력해주세요',
                        hintStyle: TextStyle(fontSize: 11.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 30.w,
                    child: ButtonTheme(
                        padding: EdgeInsets.zero,
                        child: FlatButton(
                          onPressed: () {  },
                          child: Icon(Icons.arrow_upward,color: MediaQuery.of(context).viewInsets.bottom > 200 ? PrimaryColor : Colors.black,),
                        )
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

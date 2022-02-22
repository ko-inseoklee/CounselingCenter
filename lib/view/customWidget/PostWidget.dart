import 'package:flutter/material.dart';
import 'package:online_counseling_center/model/board/board.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class PostWidget extends StatelessWidget {
  final Color backgroundColor;
  final Board board;
  const PostWidget({Key? key, required this.backgroundColor, required this.board}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class HotPostWidget extends StatelessWidget implements PostWidget{
  final int rank;
  final Color backgroundColor;
  final Board board;
  const HotPostWidget({Key? key, required this.backgroundColor, required this.board, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288.w,
      height: 68,
      margin: EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.75),
        borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        children: [
          Container(
            width: 39.w,
            alignment: Alignment.center,
            child: Text(rank.toString(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 19,
                  margin: EdgeInsets.only(top: 13),

                  child: Text(board.title,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      //TODO: board 데이터에 연령 추가.
                      Container(
                        child: Text('20대'),
                        margin: EdgeInsets.only(right: 8.w),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        child: Text(board.nickname),
                        constraints: BoxConstraints(
                          minWidth: 131.w
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        child: Icon(Icons.favorite_border,size: 10.sp,color: Colors.white,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 12.w),
                        child: Text(board.likes.toString()),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 2.w),

                        child: Icon(Icons.sms,size: 10.sp,color: Colors.white,),
                      ),
                      Container(
                        child: Text(board.comments!.length.toString()),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
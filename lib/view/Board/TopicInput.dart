import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicInput extends StatelessWidget {
  const TopicInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(onClosing: (){}, builder: (_){
      return Container(
        height: 438,
        child: Text("good"),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
      );
    });
  }
}

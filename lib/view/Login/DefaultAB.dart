import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../color.dart';

class DefaultAB extends StatefulWidget implements PreferredSizeWidget{
  final String title;
  const DefaultAB({Key? key,required this.title}) : super(key: key);

  @override
  _DefaultABState createState() => _DefaultABState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(64);
}

class _DefaultABState extends State<DefaultAB> {
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
      }, icon: Icon(Icons.arrow_back,color: Colors.black,), label: Text('')),
      centerTitle: true,
      title: Text(widget.title,style: TextStyle(color: Colors.black),),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

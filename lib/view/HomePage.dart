import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(320, 568),
        // context: context,
        // minTextAdapt: true,
        orientation: Orientation.portrait);
    // ScreenUtil().setWidth(320);
    // ScreenUtil().setHeight(568);
    ScreenUtil().setSp(11);
    return Container(child: Text('홈페이지'));
  }
}

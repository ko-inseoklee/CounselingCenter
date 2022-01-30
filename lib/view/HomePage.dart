import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/view/customWidget/SwipeCards.dart';

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
    ScreenUtil().setSp(11);
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(left: 16.w, top: 14.h),
        child: Row(
          children: [
            Text(
              'Today Topic',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage("image/navigateIcon.png")))
          ],
        ),
      ),
      SwipingCards(),
    ]);
  }
}

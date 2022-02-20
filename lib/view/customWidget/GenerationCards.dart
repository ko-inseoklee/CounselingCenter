import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../color.dart';

class GenerationCards extends StatelessWidget {
  int idx;
  bool isWrap;
  GenerationCards({Key? key, required this.idx, required this.isWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isWrap
        ? GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 9.w, mainAxisSpacing: 12.h
                // childAspectRatio: 1,
                ),
            itemBuilder: (BuildContext context, int index) {
              return generationCard(index);
            },
          )
        : ListView(
            scrollDirection: Axis.horizontal,
            children: generationCards(idx),
          );
  }

  List<Widget> generationCards(int length) {
    return List<Widget>.generate(length, (index) => generationCard(index));
  }

  Widget generationCard(int idx) {
    return Container(
      width: isWrap ? 90.w : 78.w,
      height: 78.h,
      margin: isWrap ? EdgeInsets.zero : EdgeInsets.only(right: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ImageIcon(
              AssetImage("image/generations/${idx + 1}.png"),
              size: 50.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(idx + 1) * 10}대',
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                if (idx == 5)
                  Text(
                    ' 이상',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
                  )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: PrimaryColor, borderRadius: BorderRadius.circular(24.sp)),
    );
  }
}

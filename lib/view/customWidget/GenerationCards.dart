import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_counseling_center/dummy/testMatchingData.dart';
import 'package:online_counseling_center/model/match.dart';

import 'package:online_counseling_center/color.dart';

class GenerationCards extends StatefulWidget {
  int idx;
  bool isGridview;
  List<bool> generationSelected;
  // final ValueChanged<int> changedIndex;
  // final ValueChanged<List<Match>> changeMatchingList;
  GenerationCards(
      {Key? key,
      required this.idx,
      required this.isGridview,
      required this.generationSelected,
      // required this.changedIndex,
      // required this.changeMatchingList
      })
      : super(key: key);

  @override
  _GenerationCardsState createState() => _GenerationCardsState();
}

class _GenerationCardsState extends State<GenerationCards> {
  List<Match> newMatchingList = [];

  @override
  Widget build(BuildContext context) {
    return widget.isGridview
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
            children: generationCards(widget.idx),
          );
  }

  List<Widget> generationCards(int length) {
    return List<Widget>.generate(length, (index) => generationCard(index));
  }

  Widget generationCard(int idx) {
    List<bool> generationSelected = widget.generationSelected;
    bool isGridview = widget.isGridview;

    return Container(
      width: isGridview ? 90.w : 78.w,
      height: 78.h,
      margin: isGridview ? EdgeInsets.zero : EdgeInsets.only(right: 12.w),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black, // Text Color
        ),
        onPressed: () {
          print(idx);
          if (isGridview) {
            setState(() {
              for (int i = 0; i < 6; i++) {
                if (i == idx)
                  generationSelected[i] = true;
                else
                  generationSelected[i] = false;
              }
              // widget.changedIndex(idx);
            });
          }
        },
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
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: (isGridview && !generationSelected[idx])
                            ? Gray1Color
                            : WhiteColor),
                  ),
                  if (idx == 5)
                    Text(
                      ' 이상',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: (isGridview && !generationSelected[idx])
                              ? Gray1Color
                              : WhiteColor),
                    )
                ],
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: (isGridview && !generationSelected[idx])
              ? PrimaryColor.withOpacity(0.3)
              : PrimaryColor,
          borderRadius: BorderRadius.circular(24.sp)),
    );
  }


}

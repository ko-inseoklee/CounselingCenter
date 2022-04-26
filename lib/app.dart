import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/view/HomePage.dart';
import 'package:online_counseling_center/view/SignUp/CheckTermsOfService.dart';
import 'package:online_counseling_center/view/Login/Login.dart';
import 'package:online_counseling_center/view/Login/SignUp.dart';
import 'package:online_counseling_center/view/Matching/Chat.dart';
import 'package:online_counseling_center/view/Matching/MatchingPage.dart';
import 'package:online_counseling_center/view/MainPage.dart';
import 'package:online_counseling_center/view/Board/BoardPage.dart';
import 'package:online_counseling_center/view/Board/GenerationBoardPage.dart';
import 'package:online_counseling_center/color.dart';

const primaryColor = Colors.white;

class KnockKnockApp extends StatefulWidget {
  const KnockKnockApp({Key? key}) : super(key: key);

  @override
  _KnockKnockAppState createState() => _KnockKnockAppState();
}

class _KnockKnockAppState extends State<KnockKnockApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(320, 568),
        builder: () => GetMaterialApp(
            home: HomePage(),
            getPages: [
              // GetPage(name: '/matching', page: () => MatchingPage()),
              GetPage(name: '/login', page: () => LogInPage()),
              GetPage(name: '/sign-up', page: () => SignUpPage()),
              GetPage(name: '/chat', page: () => ChatPage()),
              GetPage(name: '/board', page: () => BoardPage()),
              GetPage(
                  name: '/generationBoard', page: () => GenerationBoardPage()),
            ],
            theme: _knockTheme,
            debugShowCheckedModeBanner: false));
  }
}

final ThemeData _knockTheme = _buildKnockTheme();

ThemeData _buildKnockTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
      primaryColor: PrimaryColor,
      textTheme: _textTheme(base.textTheme),
      scaffoldBackgroundColor: BackgroundColor);
}

TextTheme _textTheme(TextTheme base) {
  return TextTheme().copyWith(
      headline2: base.headline2!
          .copyWith(fontSize: 42.sp, fontWeight: FontWeight.w400),
      headline3: base.headline3!
          .copyWith(fontSize: 34.sp, fontWeight: FontWeight.w700),
      headline4: base.headline4!
          .copyWith(fontSize: 28.sp, fontWeight: FontWeight.w400),
      headline5: base.headline5!
          .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w400),
      headline6: base.headline6!
          .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w400),
      bodyText1: base.bodyText1!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      caption:
          base.caption!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400));
}

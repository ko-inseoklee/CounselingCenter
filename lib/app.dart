import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/view/Login/Login.dart';
import 'package:online_counseling_center/view/Login/SignUp.dart';
import 'package:online_counseling_center/view/Matching/Chat.dart';
import 'package:online_counseling_center/view/Matching/MatchingPage.dart';
import 'package:online_counseling_center/view/MainPage.dart';
import 'package:online_counseling_center/view/Matching/NewMatching.dart';
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
      builder: () =>
          GetMaterialApp(
            home: MainPage(),
            getPages: [
              GetPage(name: '/matching', page: () => MatchingPage()),
              GetPage(name: '/login', page: () => LogInPage()),
              GetPage(name: '/sign-up', page: () => SignUpPage()),
              GetPage(name: '/newMatching', page: () => NewMatchingPage()),
              GetPage(name: '/chat', page: () => ChatPage()),
              GetPage(name: '/board', page: () => BoardPage()),
              GetPage(name: '/generationBoard', page: () => GenerationBoardPage()),
            ],
            theme: _knockTheme,
          ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: Size(320, 568),
      builder: () =>
          GetMaterialApp(
            home: MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: MainPage(),),
            getPages: [
              GetPage(name: '/matching', page: () => MatchingPage()),
              GetPage(name: '/login', page: () => LogInPage()),
              GetPage(name: '/sign-up', page: () => SignUpPage()),
              GetPage(name: '/newMatching', page: () => NewMatchingPage()),
              GetPage(name: '/chat', page: () => ChatPage()),
              GetPage(name: '/board', page: () => BoardPage()),
              GetPage(name: '/generationBoard', page: () => GenerationBoardPage()),
            ],
            theme: _knockTheme,
          ),
    );
  }
}



final ThemeData _knockTheme = _buildKnockTheme();

ThemeData _buildKnockTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(primaryColor: PrimaryColor);
}

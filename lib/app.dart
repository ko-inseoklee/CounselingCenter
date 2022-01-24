import 'package:flutter/material.dart';
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

void main() => runApp(GetMaterialApp(
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
      // theme: ThemeData(
      //   primaryColor: primaryColor,
      // ),
      theme: _knockTheme,
    ));

final ThemeData _knockTheme = _buildKnockTheme();

ThemeData _buildKnockTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(primaryColor: MainYellow);
}

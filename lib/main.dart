import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/view/Login/Login.dart';
import 'package:online_counseling_center/view/Login/SignUp.dart';
import 'package:online_counseling_center/view/Matching/Chat.dart';
import 'package:online_counseling_center/view/Matching/MatchingPage.dart';
import 'package:online_counseling_center/view/HomePage.dart';
import 'package:online_counseling_center/view/Matching/NewMatching.dart';
import 'package:online_counseling_center/view/Board/BoardPage.dart';

const primaryColor = Colors.white;

void main() => runApp(GetMaterialApp(
      home: HomePage(),
      getPages: [
        GetPage(name: '/matching', page: () => MatchingPage()),
        GetPage(name: '/login', page: () => LogInPage()),
        GetPage(name: '/sign-up', page: () => SignUpPage()),
        GetPage(name: '/newMatching', page: () => NewMatchingPage()),
        GetPage(name: '/chat', page: () => ChatPage()),
        GetPage(name: '/board', page: () => BoardPage()),
      ],
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
    ));
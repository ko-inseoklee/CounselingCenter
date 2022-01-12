import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/view/Login/Login.dart';
import 'package:online_counseling_center/view/Login/SignUp.dart';
import 'package:online_counseling_center/view/Matching/Chat.dart';
import 'package:online_counseling_center/view/Matching/Matching.dart';
import 'package:online_counseling_center/view/HomePage.dart';
import 'package:online_counseling_center/view/Matching/NewMatching.dart';

const primaryColor = Colors.white;

void main() => runApp(GetMaterialApp(
      home: HomePage(),
      getPages: [
        GetPage(name: '/matching', page: () => MatchingPage()),
        GetPage(name: '/login', page: () => LogInPage()),
        GetPage(name: '/sign-up', page: () => SignUpPage()),
        GetPage(name: '/newMatching', page: () => NewMatchingPage()),
        GetPage(name: '/chat', page: () => ChatPage())
      ],
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
    ));
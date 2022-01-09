import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/controller/Authentication.dart';
import 'package:online_counseling_center/view/Login/SignUp.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  Authentication authentication = new Authentication();


  TextBox iDTextBox = new TextBox(isBlank: false,hintText: '',);
  TextBox passWordTextBox = new TextBox(isBlank: true, hintText: '',);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          iDTextBox,
          passWordTextBox,
          TextButton(
              onPressed: () async {
                await authentication.signIn(
                    ID: iDTextBox.getText(),
                    password: passWordTextBox.getText());
              },
              child: Text("로그인")),
          TextButton(
              onPressed: () {
                Get.to(SignUpPage());
              },
              child: Text("회원가입")),
          TextButton(onPressed: () {}, child: Text("ID / 비밀번호 찾기"))
        ],
      ),
    );
  }
}

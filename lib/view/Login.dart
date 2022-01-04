import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  TextBox iDTextBox = new TextBox();
  TextBox passWordTextBox = new TextBox();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          iDTextBox,
          passWordTextBox,
          TextButton(onPressed: (){
            print(iDTextBox.getText());
            print(passWordTextBox.getText());
          }, child: Text("로그인"))
        ],
      ),
    );
  }
}

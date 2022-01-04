import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/controller/Authentication.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';

List<String> constantIDList = ["inseoking", "someng2"];
List<String> constantNicknameList = ["inseoking", "someng2"];

List<String> items = [
  '10대', '20대', '30대', '40대', '50대', '60대', '70대',
];

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Authentication _auth = new Authentication();

  TextBox iDInputBox = new TextBox(isBlank: false,);
  TextBox passWordInputBox = new TextBox(isBlank: true,);
  TextBox nicknameInputBox = new TextBox(isBlank: false,);
  var selectedAgeValue = '10대';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
        children: [
          iDInputBox,
          TextButton(onPressed: (){
            _auth.iDValidate = _auth.checkIDValidate(input: iDInputBox.getText(), iDs: constantIDList);
          }, child: Text("ID 중복확인")),
          passWordInputBox,
          nicknameInputBox,
          TextButton(onPressed: (){
            _auth.nickNameValidate = _auth.checkNicknameValidate(input: iDInputBox.getText(), nicknames: constantIDList);
          }, child: Text("닉네임 중복확인")),
          TextButton(onPressed: (){
          }, child: Text("남자")),
          TextButton(onPressed: (){
          }, child: Text("여자")),
          DropdownButton<String>(
            value: selectedAgeValue,
            items: items.map<DropdownMenuItem<String>>((String item){
            return DropdownMenuItem<String>(
              child: Text(item),value: item,);
            }).toList(),
            onChanged: (String? value){
              setState(() {
                selectedAgeValue = value!;
              });
            },
          ),
          TextButton(onPressed: (){
          }, child: Text("회원가입")),
          TextButton(onPressed: (){
            Get.back();
          }, child: Text("뒤로가기")),
        ],
      ),
    );
  }
}

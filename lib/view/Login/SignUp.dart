import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/controller/Authentication.dart';
import 'package:online_counseling_center/model/user.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';
import 'package:uuid/uuid.dart';

List<String> constantIDList = ["inseoking", "someng2"];
List<String> constantNicknameList = ["inseoking", "someng2"];

List<String> items = [
  '10대',
  '20대',
  '30대',
  '40대',
  '50대',
  '60대',
  '70대',
];

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Authentication _auth = new Authentication();

  TextBox _iDInputBox = new TextBox(
    isBlank: false,
  );
  TextBox _passWordInputBox = new TextBox(
    isBlank: true,
  );
  TextBox _nicknameInputBox = new TextBox(
    isBlank: false,
  );
  var _selectedAgeValue = '10대';
  bool? _inputSex;
  String? _inputAge;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          _iDInputBox,
          TextButton(
              onPressed: () {
                _auth.iDValidate = _auth.checkIDValidate(
                    input: _iDInputBox.getText(), iDs: constantIDList);
              },
              child: Text("ID 중복확인")),
          _passWordInputBox,
          _nicknameInputBox,
          TextButton(
              onPressed: () {
                _auth.nickNameValidate = _auth.checkNicknameValidate(
                    input: _iDInputBox.getText(), nicknames: constantIDList);
              },
              child: Text("닉네임 중복확인")),
          TextButton(
              onPressed: () {
                _inputSex = true;
              },
              child: Text("남자")),
          TextButton(
              onPressed: () {
                _inputSex = false;
              },
              child: Text("여자")),
          DropdownButton<String>(
            value: _selectedAgeValue,
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedAgeValue = value!;
                _inputAge = _selectedAgeValue;
              });
            },
          ),
          TextButton(
              onPressed: () {
                if (_inputAge == null || _inputSex == null) {
                  print("Bad request");
                } else if (_auth.iDValidate && _auth.nickNameValidate) {
                  _auth.signUp(
                      iD: _iDInputBox.getText(),
                      password: _passWordInputBox.getText(),
                      age: _inputAge!,
                      sex: _inputSex!,
                      nickname: _nicknameInputBox.getText());
                } else {
                  print("Can't sign up: validation check yet");
                }
              },
              child: Text("회원가입")),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("뒤로가기")),
        ],
      ),
    );
  }
}

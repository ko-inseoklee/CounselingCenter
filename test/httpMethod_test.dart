import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/ignore.dart';
import 'package:online_counseling_center/model/user.dart';

void main(){

  test("아이디 중복확인",() async {
    String userID = "tjrkd222";
    final Map<String, String> _queryParameters = <String, String>{
      'id': userID,
    };

    var uri = Uri.http(apiServer, '/users/verifyId',_queryParameters);

    http.Response response = await http.get(uri);

    print('body = ${response.body}');

    assert(response.statusCode == 200, "Fail to get method statuscode = ${response.statusCode}");
  });

  test("아이디 생성",() async{
    User user = new User(ID: 'tjrkd2222', password: '12345', uID: '12345', age: '30대', sex: '남자', phoneVerified: false, nickname: 'inseoking');

    UserController userController = new UserController(user: user);

    var uri = Uri.http(apiServer, 'users/create');

    http.Response response = await http.post(uri,
      headers: <String,String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'uID' : userController.user.value.uID,
        'ID' : userController.user.value.ID,
        'password' : userController.user.value.password,
        'age' : userController.user.value.age,
        'nickname' : userController.user.value.nickname,
        'sex' : userController.user.value.sex,
        'phoneVerified' : userController.user.value.phoneVerified
      })
    );

    // assert(response.statusCode == 200, "Bad Request");

  });
}

// private String uID;
// private String ID;
// private String password;
// private String age;
// private String nickname;
// private String sex;
// private boolean phoneVerified;
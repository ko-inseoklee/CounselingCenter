import 'package:flutter/animation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/controller/Authentication.dart';
import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/model/user.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

void main() {

  /*
  test("User Model Test",() {
    String uid = Uuid().v4.toString();
    String age = '20대';
    String nickName = "Inseoking";
    User user = User(age: age, nickName: nickName, uID: uid, ID: 'tjrkd222', password: 'dkssud11', sex: '남',);
    User user2 = User.init();

    UserController userController = new UserController(user: user);

    assert(user == userController.user, 'test failed, [UID] first = ${user.uID}, second = ${user2.uID}');
  });
  */

  test("ID Validation",(){
    List<String> ids = ["tjrkd222", "tjrkd111", "tjrkd000"];
    String id = "tjrkd222";
    Authentication auth = new Authentication();

    bool result = auth.checkIDValidate(input: id, iDs: ids);

    assert(result, 'Test Failed, ID = $id');

  });

  //TODO: Observer pattern 확인완료. 백엔드 API 개발 후 네트워킹 테스트 예정.
  test("Sign up",(){
    Authentication _auth = new Authentication();

    _auth.signUp(iD: 'tjrkd222', password: '1234', age: '10대', sex: '남', nickname: '인석이');

    UserController _usercontroller = Get.find<UserController>();

    assert(_auth.user == _usercontroller.user, "Failed Sign up");
  });


}

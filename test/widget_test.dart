import 'package:flutter_test/flutter_test.dart';
import 'package:online_counseling_center/controller/Authentication.dart';
import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/model/user.dart';
import 'package:uuid/uuid.dart';

void main() {

  test("User Model Test",() {
    String uid = Uuid().v4.toString();
    int age = 20;
    String nickName = "Inseoking";
    User user = User(age: age, nickName: nickName, uID: uid, ID: 'tjrkd222', password: 'dkssud11', sex: true,);
    User user2 = User.init();

    UserController userController = new UserController(user: user);

    assert(user == userController.user, 'test failed, [UID] first = ${user.uID}, second = ${user2.uID}');
  });

  test("ID Validation",(){
    List<String> ids = ["tjrkd222", "tjrkd111", "tjrkd000"];
    String id = "tjrkd222";
    Authentication auth = new Authentication();

    bool result = auth.checkIDValidate(input: id, iDs: ids);

    assert(result, 'Test Failed, ID = $id');

  });
}

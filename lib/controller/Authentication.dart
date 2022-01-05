import 'package:get/get.dart';
import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/model/user.dart';
import 'package:uuid/uuid.dart';

class Authentication{
  bool iDValidate = false;
  bool nickNameValidate = false;

  late var user;
  late UserController _userController;

  //TODO: Should be change IDs with server . current: constant value.
  bool checkIDValidate({required String input,required List<String> iDs}){
    return iDs.contains(input);
  }

  //TODO: Same as ID validate.
  bool checkNicknameValidate({required String input,required List<String> nicknames}){
    return nicknames.contains(input);
  }

  void signUp({required String iD, required String password, required String age, required bool sex, required String nickname}){
    String uID = Uuid().v4().toString();
    user = new User(age: age, nickName: nickname, uID: uID, ID: iD, password: password, sex: sex);

    _userController = UserController(user: user);
    Get.put(_userController);
  }

}
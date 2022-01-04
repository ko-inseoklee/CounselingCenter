import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/model/user.dart';

class Authentication{
  bool _iDValidate = false;
  bool _nickNameValidate = false;

  late var _user;
  late UserController _userController;



  set iDValidate (bool result) => _iDValidate = result;
  set nickNameValidate (bool result) => _nickNameValidate = result;

  //TODO: Should be change IDs with server . current: constant value.
  bool checkIDValidate({required String input,required List<String> iDs}){
    return iDs.contains(input);
  }

  //TODO: Same as ID validate.
  bool checkNicknameValidate({required String input,required List<String> nicknames}){
    return nicknames.contains(input);
  }


}
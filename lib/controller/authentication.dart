import 'package:online_counseling_center/model/user.dart';

class Authentication{
  late var user;


  //TODO: Should be change IDs with server . current: constant value.
  bool checkIDValidate({required String input,required List<String> iDs}){
    return iDs.contains(input);
  }

  //TODO: Same as ID validate.
  bool checkNicknameValidate({required String input,required List<String> nicknames}){
    return nicknames.contains(input);
  }
}
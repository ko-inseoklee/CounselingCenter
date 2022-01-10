import 'package:get/get.dart';
import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/model/user.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class Authentication extends GetxController{
  bool iDValidate = false;
  bool nickNameValidate = false;

  late var user;
  late UserController _userController;

  //TODO: Should be change IDs with server . current: constant value.
  bool checkIDValidate({required String input,required List<String> iDs}){
    return !iDs.contains(input);
  }

  Future<bool> checkIDValidateWithServer({required String input}) async{
    var uri =  Uri.http('localhost:8080','users/idVerified');
    http.Response response = await http.post(uri,
      headers: <String,String>{
        'content-type' : "application/json;"
      },
      body: input
    );

    if(response.statusCode == 200) return true;
    return false;
  }

  //TODO: Same as ID validate.
  bool checkNicknameValidate({required String input,required List<String> nicknames}){
    return !nicknames.contains(input);
  }

  Future<void> signUp({required String iD, required String password, required String age, required String sex, required String nickname}) async{
    String uID = Uuid().v4().toString();
    User user = new User(age: age, nickname: nickname, uID: uID, ID: iD, password: password, sex: sex, phoneVerified: false);

    try{
      var uri = Uri.http('localhost:8080', '/user/${user.uID}');
      print(user.uID);

      http.Response response = await http.post(
        uri,
        //TODO: 헤더 공부
        // headers: <String,String>{
        //   'content-type': 'application/json;',
        // },
        body: user.toJson()
      );

      _userController = UserController(user: user);
      Get.put(_userController);
    } catch(e){
      print(e);
    }
  }
  
  Future<void> signIn({required String ID, required String password}) async{
    try{
      var uri = Uri.http('localhost:8080', '/users?ID=${ID}&pw=${password}');
      var response = await http.get(uri);

      assert(response.statusCode == 200, "Bad Request");

    } catch(e){
      print(e);
    }
  }
}
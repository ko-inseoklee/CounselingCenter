import 'dart:convert';

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


  Future<bool> checkIDValidate({required String input}) async{
    final Map<String, String> _queryParameters = <String, String>{
      'id': input,
    };

    var uri = Uri.http('localhost:8080', '/users/verify-id',_queryParameters);
    try{
      http.Response response = await http.get(uri);
      if(response.statusCode == 200){
        return response.body == 'false' ? true : false;
      }
    } catch (e){
      print(e);

      return false;
    }

    return false;
  }

  //TODO: Same as ID validate.
  Future<bool> checkNicknameValidate({required String input}) async{
    final Map<String, String> _queryParameters = <String, String>{
      'nickname': input,
    };

    var uri = Uri.http('localhost:8080', '/users/verify-nickname',_queryParameters);
    try{
      http.Response response = await http.get(uri);
      if(response.statusCode == 200){
        return response.body == 'false' ? true : false;
      }
    } catch (e){
      print(e);

      return false;
    }

    return false;
  }

  Future<bool> signUp({required String iD, required String password, required String age, required String sex, required String nickname}) async{
    String uId = Uuid().v4().toString();

    User user = new User(ID: iD, password: password, uID: uId, age: age, sex: sex, phoneVerified: false, nickname: nickname);

    UserController userController = new UserController(user: user);

    var uri = Uri.http('localhost:8080', 'users/create');
    try{

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
      if(response.statusCode == 200){
        Get.put<UserController>(userController);
        return true;
      }else{
        return false;
      }

    } catch(e){
      return false;
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
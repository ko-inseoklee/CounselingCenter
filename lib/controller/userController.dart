import 'package:get/get.dart';
import 'package:online_counseling_center/model/user.dart';

class UserController extends GetxController{
  var user = User.init().obs;

  void setUser(User user){
    this.user = user.obs;
  }

  UserController({required User user}): this.user = user.obs;

  User getUser(){
    return user.value;
  }
}
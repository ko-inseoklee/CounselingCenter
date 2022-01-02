import 'package:get/get.dart';
import 'package:online_counseling_center/model/user.dart';

class UserController extends GetxController{
  late Rx<User> user;
  int idx = 0;
  addUser({required String name}){
    user.value.nickName = name;
  }
}
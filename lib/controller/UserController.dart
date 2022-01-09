import 'package:get/get.dart';
import 'package:online_counseling_center/model/user.dart';

class UserController extends GetxController{
  Rx<User> user;

  UserController({required User user}): this.user = user.obs;
}
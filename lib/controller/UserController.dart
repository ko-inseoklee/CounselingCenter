import 'package:get/get.dart';
import 'package:online_counseling_center/model/user.dart';

class UserController extends GetxController{
  Rx<User> _user = User.init().obs;

  set user (User user) => _user = user.obs;
  User get user => _user.value;

  UserController({required User user}): this._user = user.obs;


}
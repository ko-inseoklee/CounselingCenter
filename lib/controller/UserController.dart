import 'package:get/get.dart';
import 'package:online_counseling_center/ignore.dart';
import 'package:online_counseling_center/model/user/user.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController{
  Rx<User> user;

  UserController({required User user}): this.user = user.obs;

  // makeMatchingRoom({required String topic, required String title, required String ownerId, required String otherId}) async{
  //   String roomID = Uuid().v4().toString();
  //   Chatter chatter = new Chatter(topic : topic);
  //
  //   var uri = Uri.http(apiServer, '/matching');
  //   try
  //
  //   catch(e){
  //   errordiga
  //   }
  //   http.Response response = http.post(url,
  //   headers:
  //   )
  // }
}
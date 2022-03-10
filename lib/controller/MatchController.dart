import 'package:get/get.dart';
import 'package:online_counseling_center/model/match.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';

class MatchController extends GetxController {
  Rx<Match> match;

  MatchController({required Match match}) : this.match = match.obs;

  getNickname({required Match match}) {
    MatchController matchController = MatchController(match: match);
    String nickname = '';

    if (matchController.match.value.chatterId == user_me.uID) {
      // print('user_me info!');
      nickname = user_me.nickname;
    } else if (matchController.match.value.chatterId == user1.uID)
      nickname = user1.nickname;
    else if (matchController.match.value.chatterId == user2.uID)
      nickname = user2.nickname;
    else
      print('NO user info!');

    return nickname;
  }

  getAge({required Match match}) {
    MatchController matchController = MatchController(match: match);
    String age = '';

    if (matchController.match.value.chatterId == user_me.uID) {
      // print('user_me info!');
      age = user_me.age;
    } else if (matchController.match.value.chatterId == user1.uID)
      age = user1.age;
    else if (matchController.match.value.chatterId == user2.uID)
      age = user2.age;
    else
      print('NO user info!');

    return age;
  }

  getSex({required Match match}) {
    MatchController matchController = MatchController(match: match);
    String sex = '';

    if (matchController.match.value.chatterId == user_me.uID) {
      // print('user_me info!');
      sex = user_me.sex;
    } else if (matchController.match.value.chatterId == user1.uID)
      sex = user1.sex;
    else if (matchController.match.value.chatterId == user2.uID)
      sex = user2.sex;
    else
      print('NO user info!');

    return sex;
  }

}


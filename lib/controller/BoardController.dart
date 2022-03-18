import 'package:get/get.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/board/generalBoard.dart';

class BoardController extends GetxController{
  Rx<GeneralBoard> board;

  BoardController({required GeneralBoard board}) : this.board = board.obs;

  getNickname({required GeneralBoard board}) {
    BoardController boardController = BoardController(board: board);
    String nickname = '';

    if (boardController.board.value.writerID == user_me.uID) {
      // print('user_me info!');
      nickname = user_me.nickname;
    } else if (boardController.board.value.writerID == user1.uID)
      nickname = user1.nickname;
    else if (boardController.board.value.writerID == user2.uID)
      nickname = user2.nickname;
    else
      print('NO user info!');

    return nickname;
  }
}
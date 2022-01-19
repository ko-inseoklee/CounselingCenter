import 'package:get/get.dart';
import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/board/board.dart';

class BoardController extends GetxController{
  Rx<Board> board;

  BoardController({required Board board}) : this.board = board.obs;

  getNickname({required Board board}) {
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
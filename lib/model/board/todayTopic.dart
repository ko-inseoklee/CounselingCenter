import 'package:online_counseling_center/model/board/comment.dart';

class TodayTopic {
  String date;
  String question;
  String title;
  String writerID; // 작성자 id
  int likes; // 좋아요 수
  List<Comment>? comments;
  //TODO: modeling 추가

  TodayTopic.init()
      : title = '',
        likes = 0,
        writerID = '',
        comments = [],
        question = '',
        date = '';

  TodayTopic({
    required this.date,
    required this.question,
    required this.writerID,
    required this.title,
    required this.likes,
    required this.comments,
  });
}

class TodayTopic {
  String date;
  String question;
  String writerID; // 작성자 id
  int likes; // 좋아요 수
  List<String>? comments;
  //TODO: modeling 추가

  TodayTopic({
    required this.date,
    required this.question,
    required this.writerID,
    required this.likes,
    required this.comments,
  });
}

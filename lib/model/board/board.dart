class Board {
  String bID;
  String title;
  String category;
  String contents;
  int likes; // 좋아요 수
  String writerID; // 작성자
  String nickname;
  String writtenTime; // 작성시간
  //TODO: bID로 댓글 따로 불러오기.
  List<String>? comments;

  Board.init()
      : title = '',
        category = '',
        bID = '',
        nickname = '',
        contents = '',
        likes = 0,
        writerID = '',
  comments = [],
        writtenTime = '';

  Board({
    required this.title,
    required this.bID,
    required this.category,
    required this.contents,
    required this.likes,
    required this.writerID,
    required this.nickname,
    required this.writtenTime,
    required this.comments
  });
}

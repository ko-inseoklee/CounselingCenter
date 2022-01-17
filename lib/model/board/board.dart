class Board {
  String bID;
  String category;
  String contents;
  int likes; // 좋아요 수
  String writerID; // 작성자
  String writtenTime; // 작성시간

  Board.init()
      : category = '',
        bID = '',
        contents = '',
        likes = 0,
        writerID = '',
        writtenTime = '';

  Board({
    required this.bID,
    required this.category,
    required this.contents,
    required this.likes,
    required this.writerID,
    required this.writtenTime,
  });
}

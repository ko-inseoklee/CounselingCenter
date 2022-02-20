class Comment {
  String bID;
  String cID;
  String contents;
  String writerID;
  String writtenTime;
  String title;
  int like;
  List<Comment> re;

  Comment.init()
  : bID = '',
  cID = '',
  contents = '',
  writerID = '',
  writtenTime = '',
  like = 0,
  title = '',
  re = [];

  Comment({required this.bID,required this.cID,required this.contents,required this.writerID,required this.title ,required this.writtenTime, required this.like, required this.re});
}
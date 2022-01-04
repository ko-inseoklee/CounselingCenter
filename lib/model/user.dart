class User{
  final String ID;
  final String password;
  final String uID;
  final int age;
  final bool sex;
  bool phoneVerified = false;
  String nickName = '';
  //TODO: 게시글 리스트, 내 댓글 리스트

  User.init()
  : this.ID = " ",
  this.password = " ",
  this.uID = " ",
  this.age = 0,
  this.sex = true;

  User({required this.age, required this.nickName, required this.uID, required this.ID, required this.password, required this.sex });
}
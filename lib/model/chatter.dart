class Chatter {
  String topic;
  String title;
  // 방장
  String ID_;
  String uID_;
  String age_;
  String sex_;
  String nickName_;

  // 방 참여자
  List<String> ID;
  List<String> uID;
  List<String> age;
  List<String> sex;
  List<String> nickName;

  // 참여 제한
  List<String> ageLimit;
  List<String> sexLimit;

  Chatter.init()
      : this.topic = ' ',
        this.title = ' ',
        this.ID_ = ' ',
        this.uID_ = ' ',
        this.age_ = ' ',
        this.sex_ = ' ',
        this.nickName_ = ' ',
        this.ID = [],
        this.uID = [],
        this.age = [],
        this.sex = [],
        this.nickName = [],
        this.ageLimit = [],
        this.sexLimit = [];

  Chatter({
    required this.topic,
    required this.title,
    required this.age_,
    required this.nickName_,
    required this.uID_,
    required this.ID_,
    required this.sex_,
    required this.ID,
    required this.age,
    required this.nickName,
    required this.uID,
    required this.sex,
    required this.ageLimit,
    required this.sexLimit,
  });
}

class Chatter {
  List<String> ID;
  // List<String> password;
  List<String> uID;
  List<String> age;
  List<bool> sex;
  List<String> nickName;

  Chatter.init()
      : this.ID = [],
        // this.password = [],
        this.uID = [],
        this.age = [],
        this.sex = [],
        this.nickName = [];

  Chatter(
      {required this.age,
      required this.nickName,
      required this.uID,
      required this.ID,
      // required this.password,
      required this.sex});
}

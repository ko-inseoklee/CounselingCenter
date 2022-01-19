class Match {
  String topic;
  String title;

  String chatId; // 채팅방 id
  String chatterId; // 방장 id
  String partnerId; // 대화상태 id

  // 참여 제한
  List<String> ageLimit;
  List<String> sexLimit;

  // Match.init()
  //     : this.topic = ' ',
  //       this.title = ' ',
  //       this.chatId = ' ',
  //       this.chatterId = ' ',
  //       this.partnerId = ' ',
  //       this.ageLimit = [],
  //       this.sexLimit = [];

  Match({
    required this.topic,
    required this.title,
    required this.chatId,
    required this.chatterId,
    required this.partnerId,
    required this.ageLimit,
    required this.sexLimit,
  });
}

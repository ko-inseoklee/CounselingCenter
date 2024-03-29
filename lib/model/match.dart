class Match {
  String topic;
  String title;
  String matchingID; // 채팅방 id
  String hostID; // 방장 id
  List<String> partnerID; // 대화상태 id
  List<String> ageLimit; // 참여 제한

  // Match.init()
  //     : this.topic = ' ',
  //       this.title = ' ',
  //       this.chatId = ' ',
  //       this.chatterId = ' ',
  //       this.partnerId = ' ',
  //       this.ageLimit = [],

  Match({
    required this.topic,
    required this.title,
    required this.matchingID,
    required this.hostID,
    required this.partnerID,
    required this.ageLimit,
  });

}

final List<String> topicList = [
  '세대차이',
  '만화/애니',
  '방송/연예',
  '문화/예술',
  '영화',
  '음악',
  '여행',
  '연애',
  '스포츠/레저',
  '반려동물',
  '취미',
  '패션/미용',
  '건강',
  '가족/육아',
  '교육',
  '게임',
  '일상생활',
  '기타'
];

final List<String> ageList = ['10대', '20대', '30대', '40대', '50대', '60대 이상'];

import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/match.dart';

Match match1 = Match(
    topic: '세대차이',
    title: '할아버지와의 말이 안통해요..',
    matchingID: '0',
    hostID: user_me.uID,
    partnerID: [],
    ageLimit: ['50대', '60대 이상'],
 );

Match match2 = Match(
    topic: '가족/육아',
    title: '나이차는 시누랑 어떻게 해야될지 모르게써요ㅠㅠㅠㅠ',
    matchingID: '1',
    hostID: user1.uID,
    partnerID: [],
    ageLimit: ['10대', '20대', '30대', '50대', '60대 이상','40대'],
    );

Match match3 = Match(
    topic: '게임',
    title: '롤 같이 하실분  구해요~',
    matchingID: '2',
    hostID: user2.uID,
    partnerID: [],
    ageLimit: ['10대', '20대', '30대', '40대'],
    );

Match match4 = Match(
    topic: '세대차이',
    title: '세대차이 어떻게 극복할까요?',
    matchingID: '0',
    hostID: user1.uID,
    partnerID: [],
    ageLimit: ['10대', '20대', '30대'],
    );

List<Match> matching_rooms = [match1, match2, match3, match4];

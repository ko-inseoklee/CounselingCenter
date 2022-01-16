import 'package:online_counseling_center/dummy/testUserData.dart';
import 'package:online_counseling_center/model/match.dart';

Match match1 = Match(
    topic: '세대 차이',
    title: '할아버지와의 세대 차이.. 도와주세요!',
    chatId: '0',
    chatterId: user_me.uID,
    partnerId: '',
    ageLimit: ['50대', '60대', '70대'],
    sexLimit: ['남', '여']);

Match match2 = Match(
    topic: '우정',
    title: '친구랑 다퉜는데 화해하고 싶어요ㅜ',
    chatId: '1',
    chatterId: user1.uID,
    partnerId: '',
    ageLimit: ['10대', '20대', '30대', '50대', '60대', '70대', '40대'],
    sexLimit: ['남']);

Match match3 = Match(
    topic: '취업/진로',
    title: '대기업 면접 스터디 구해요~',
    chatId: '2',
    chatterId: user2.uID,
    partnerId: '',
    ageLimit: ['20대', '30대'],
    sexLimit: ['남', '여']);

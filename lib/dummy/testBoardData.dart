import 'package:online_counseling_center/model/board/generalBoard.dart';

GeneralBoard board1 = GeneralBoard(
  bID: '0',
  title: "연애 고민",
  category: '동세대',
  contents: '블라블라 테스트용 게시판 내용1',
  writerID: 'uid_0',
  likes: 10,
  nickname: 'Inseoking',
  writtenTime: '',
  comments: new List.empty()
);

GeneralBoard board2 = GeneralBoard(
  bID: '1',
  title: "취업 고민",
  category: '동세대',
  contents: '블라블라 테스트용 게시판 내용2',
  writerID: 'uid_1',
  likes: 20,
  nickname: 'someng',
  writtenTime: '',
    comments: List.empty()
);

GeneralBoard board3 = GeneralBoard(
  bID: '2',
  title: "운동 고민",
  category: '타세대',
  contents: '블라블라 테스트용 게시판 내용3',
  writerID: 'uid_2',
  likes: 25,
  nickname: 'Inseoking',
  writtenTime: '',
    comments: List.empty()
);

import 'package:online_counseling_center/model/board/board.dart';

Board board1 = Board(
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

Board board2 = Board(
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

Board board3 = Board(
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

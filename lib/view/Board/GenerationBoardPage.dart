import 'package:flutter/material.dart';
import 'package:online_counseling_center/controller/BoardController.dart';
import 'package:online_counseling_center/dummy/testBoardData.dart';
import 'package:online_counseling_center/model/board/board.dart';

class GenerationBoardPage extends StatefulWidget {
  const GenerationBoardPage({Key? key}) : super(key: key);

  @override
  _GenerationBoardPageState createState() => _GenerationBoardPageState();
}

class _GenerationBoardPageState extends State<GenerationBoardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text('세대별 게시판'),
              bottom: TabBar(tabs: [
                Tab(
                  text: '동세대',
                ),
                Tab(text: '타세대')
              ])),
          body: TabBarView(
            children: [boardList(), Text('타세대')],
          )),
    );
  }
}

Widget boardList() {
  List<Board> boardList = [board1, board2, board3];

  return ListView.separated(
      itemBuilder: (context, index) {
        BoardController boardController =
            BoardController(board: boardList[index]);
        Board board = boardList[index];
        return Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: 120,
            child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('${boardList[index].contents}'),
                          TextButton(
                              onPressed: () {},
                              child: Icon(Icons.navigate_next_outlined)),
                        ],
                      ),
                      // trailing: TextButton(
                      //     onPressed: () {},
                      //     child: Icon(Icons.navigate_next_outlined)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 2.0, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${boardController.getNickname(board: board)}'),
                            Row(
                              children: [
                                Icon(
                                  Icons.thumb_up,
                                  color: Color(0xff00B9FF),
                                ),
                                Text('  ${boardList[index].likes}')
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )));
      },
      separatorBuilder: (context, index) {
        return Container();
      },
      itemCount: boardList.length);
}

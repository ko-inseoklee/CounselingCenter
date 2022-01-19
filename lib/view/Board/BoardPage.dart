import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('소통 게시판')),
        body: Center(
          child: Column(children: [
            Container(height: 100),
            Container(
              height: 150,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/generationBoard');
                },
                child: Text(
                  '세대별 게시판',
                  style: TextStyle(fontSize: 25),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffFFC700)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
            ),
            Container(height: 50),
            Container(
              height: 150,
              width: 350,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Today Topic',
                  style: TextStyle(fontSize: 25),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff00B9FF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
            ),
          ]),
        ));
  }
}

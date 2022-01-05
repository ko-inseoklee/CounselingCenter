import 'package:flutter/material.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  final List<String> users = <String>['소망', '인석', '성은', '예찬', '지열', '지웅'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('매칭방')),
      body: Column(children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonPadding: EdgeInsets.fromLTRB(15, 10, 15, 5),
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text('성별'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('주제'),
            ),
            SizedBox(
              width: 20,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                '매칭방 만들기',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.black38,
          indent: 20,
          endIndent: 20,
        ),
        Container(
          height: 500,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                height: 120,
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.add_reaction),
                        title: Text(users[index]),
                      )
                    ]
                  )
                ),
              );
            },
            itemCount: users.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        )
      ]),
    );
  }
}

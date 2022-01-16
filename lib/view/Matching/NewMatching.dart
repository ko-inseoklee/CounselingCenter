import 'package:flutter/material.dart';
import 'package:online_counseling_center/view/customWidget/TextBox.dart';
import 'package:get/get.dart';

Map<String, bool> ageList = {
  '10대': true,
  '20대': true,
  '30대': true,
  '40대': true,
  '50대': true,
  '60대': true,
  '70대 이상': true,
};

Map<String, bool> sexList = {
  '남자': true,
  '여자': true,
};

class NewMatchingPage extends StatefulWidget {
  const NewMatchingPage({Key? key}) : super(key: key);

  @override
  _NewMatchingPageState createState() => _NewMatchingPageState();
}

class _NewMatchingPageState extends State<NewMatchingPage> {
  List<String> topic_list = ['우정', '연애/사랑', '취업/진로', '세대 차이'];
  String selected_topic = '세대 차이';

  final _CheckBoxState check = _CheckBoxState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('새 매칭방')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Wrap(
          runSpacing: 25,
          children: [
            Text('주제',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            Center(
              child: Container(
                width: 140,
                child: DropdownButton(
                    isExpanded: true,
                    value: selected_topic,
                    items: topic_list.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem(
                          child: Center(child: Text(value)),
                          value: value,
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selected_topic = newValue!;
                      });
                    }),
              ),
            ),
            Text('방 제목',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextBox(
                      isBlank: false,
                      hintText: '방 제목 입력',
                    ))),
            Text('매칭 파트너 연령',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            CheckBox(list: ageList,),
            Text('매칭 파트너 성별',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            CheckBox(list: sexList),
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[400]),
                    onPressed: () {
                      check.getItems(list: ageList);
                      check.getItems(list: sexList);
                      Get.off('/matching');
                    },
                    child: Text('매칭방 만들기'))),
          ],
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  // Rx<Map> List;

  final Map<String, bool> list;

  const CheckBox({Key? key, required this.list}) : super(key: key);


  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  var holder = [];

  getItems({required Map<String, bool> list}) {
    list.forEach((key, value) {
      if (value == true) {
        holder.add(key);
      }
    });

    // Print all selected items on Terminal screen.
    print(holder);
    // Here you will get all your selected Checkbox items.
    // 서버 연결 후, db에 체크된 항목 저장

    // Clear array after use.
    holder.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget.list.keys.map((String key) {
            return Row(
              children: [
                Column(
                  children: [
                    Text(key),
                    Checkbox(
                      value: widget.list[key],
                      activeColor: Colors.deepPurple[400],
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          widget.list[key] = value!;
                        });
                      },
                    )
                  ],
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:online_counseling_center/model/user.dart';
import 'package:uuid/uuid.dart';

void main() {

  test("Model Test",() {
    String uid = Uuid().v4.toString();
    int age = 20;
    String nickName = "Inseoking";
    User(age, nickName, uid);
  });
}

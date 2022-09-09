import 'package:get/get.dart';

class MatchTabController extends GetxController {
  var isTab1 = true.obs;

  void toggleTab(bool state) {
    isTab1.value = state;

  }

  // void hideEditButtons(bool state) {
  //   editButtonClicked = state;
  // }
}

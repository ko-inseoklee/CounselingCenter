import 'package:get/get.dart';

class MatchTabController extends GetxController{
  var isTab1 = true.obs;

  void toggleTab() {
    isTab1.value = !(isTab1.value);
  }
}
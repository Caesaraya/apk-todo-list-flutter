import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int i) {
    currentIndex.value = i;
  }
}

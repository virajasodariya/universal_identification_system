import 'package:get/get.dart';

class SelectionController extends GetxController {
  int currentIndex = 0;

  bottomBarValue(int value) {
    currentIndex = value;
    update();
  }
}

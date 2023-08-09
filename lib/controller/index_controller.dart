import 'package:get/get.dart';

class NavIndexController extends GetxController {
  RxInt currentPageIndex = 0.obs;

  void updatePageIndex(int newIndex) {
    currentPageIndex.value = newIndex;
  }
}

import 'package:get/get.dart';

class FilterIndexController extends GetxController {
  List<String> exploreItems = [
    'Missions',
    '3D Models',
    'Augmented Reality',
    'History'
  ];

  RxInt selectedIndex = 0.obs;
}

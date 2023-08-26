import 'dart:async';

import 'package:get/get.dart';
import 'package:stellarhub/models/next_launch_model.dart';
import 'package:stellarhub/services/next_launch_service.dart';

class ClockController extends GetxController {
  RxString hours = '0'.obs;
  RxString minutes = '0'.obs;
  RxString seconds = '0'.obs;

  RxString description = '-'.obs;

  static late Timer timer;
  int _unixTime = 0;

  @override
  void onInit() async {
    await getTimeData();
    startClockUpdate();
    super.onInit();
  }

  void startClockUpdate() async {
    updateTime(_unixTime);
    timer = Timer.periodic(
        const Duration(seconds: 1), (timer) => updateTime(_unixTime));
  }

  void updateTime(int unixTime) {
    DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    DateTime currentTime = DateTime.now();

    Duration difference = targetTime.difference(currentTime);

    if (difference.inHours <= 9) {
      hours.value = '0${difference.inHours}';
    } else {
      hours.value = difference.inHours.toString();
    }

    if (difference.inMinutes.remainder(60) <= 9) {
      minutes.value = '0${difference.inMinutes.remainder(60).toString()}';
    } else {
      minutes.value = difference.inMinutes.remainder(60).toString();
    }

    if (difference.inSeconds.remainder(60) <= 9) {
      seconds.value = '0${difference.inSeconds.remainder(60).toString()}';
    } else {
      seconds.value = difference.inSeconds.remainder(60).toString();
    }
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  Future getTimeData() async {
    final NextLaunchModel model = await NextLaunchService().getNextStart();
    _unixTime = int.parse(model.sort_date);
    description.value = model.provider_name;
  }
}

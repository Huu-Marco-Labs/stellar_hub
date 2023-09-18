import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/navigation_bar_widget.dart';
import '../../constants.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  static const String settingScreenRoute = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(NavigationBarWidget.navigationBarWidget);
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

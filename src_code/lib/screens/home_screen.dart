import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/index_controller.dart';
import '../screens/setting_screen.dart';
import '../constants.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String homeScreenRoute = '/home';
  final NavIndexController indexController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        toolbarHeight: 100.h,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3.5),
            child: IconButton(
              onPressed: () {
                Get.toNamed(SettingScreen.settingScreenRoute);
              },
              icon: const Icon(Icons.settings_outlined),
            ),
          ),
        ],
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
          child: Column(
            children: [
              Text(
                'TODAY',
                style: kDefaultText(30.sp, kSpaceFont),
              ),
              Text(
                'February 10',
                style: kLowWeightText(16.sp, kFreudFont),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'News',
              style: kBoldText(
                15.sp,
                kFreudFont,
              ),
            ),
            TextButton(
              onPressed: () {
                indexController.updatePageIndex(1);
              },
              child: Row(
                children: [
                  Text(
                    'View all',
                    style: kLowWeightText(
                      12.sp,
                      kFreudFont,
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: kGrey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

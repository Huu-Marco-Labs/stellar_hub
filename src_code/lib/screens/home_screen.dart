import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/test_model.dart';
import '../screens/setting_screen.dart';
import '../constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/header_widgets/list_header_widget.dart';
import '../widgets/header_widgets/view_all_header_widget.dart';
import '../widgets/list_view_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String homeScreenRoute = '/home';

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('MMMM d').format(currentDate);

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kSecondaryColor,
              toolbarHeight: 100.h,
              actions: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding * 3.5),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(SettingScreen.settingScreenRoute);
                    },
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ),
              ],
              title: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TODAY',
                      style: kDefaultText(30.sp, kSpaceFont),
                    ),
                    Text(
                      formattedDate,
                      style: kLowWeightText(18.sp, kFreudFont),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 4),
            child: Column(
              children: [
                viewAll('News', 1),
                listViewWidget(images1, 178.h),
                SizedBox(height: kSizedBox),
                viewAll('Images of the Day', 3),
                listViewWidget(images2, 125.h),
                SizedBox(height: kSizedBox),
                viewAll('Videos of the Day', 3),
                listViewWidget(images3, 167.h),
                SizedBox(height: kSizedBox),
                listHeaderWidget('Recent Tweets'),
                SizedBox(height: kSizedBox),
                Image.asset('assets/images/test4.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

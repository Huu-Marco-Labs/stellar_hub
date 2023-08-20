import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../controller/index_controllers/nav_index_controller.dart';

Row viewAllHeaderWidget(String title,
    {int? index, String? destinationRoute, bool useNavigation = false}) {
  final NavIndexController navIndexController = Get.find();

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: kBoldText(
          15.sp,
          kFreudFont,
        ),
      ),
      TextButton(
        onPressed: () {
          if (useNavigation) {
            Get.toNamed('$destinationRoute');
          } else {
            navIndexController.updatePageIndex(index!);
          }
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
              child: kForwardIcon,
            ),
          ],
        ),
      ),
    ],
  );
}

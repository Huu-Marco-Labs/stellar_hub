import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../controller/index_controller.dart';

Row viewAll(String title, int index) {
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
          navIndexController.updatePageIndex(index);
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
      ),
    ],
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stellarhub/controller/clock_controller.dart';

import '../../constants.dart';
import 'clock_column_widget.dart';

SingleChildScrollView clockWidget() {
  ClockController clockController = Get.find();

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    child: Container(
      constraints: BoxConstraints(minWidth: 380.w),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Row(
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 190.w),
                    child: Row(
                      children: [
                        clockColumnWidget(
                            clockController.hours.toString() + ':',
                            'hours',
                            50.sp),
                        clockColumnWidget(
                            clockController.minutes.toString() + ':',
                            'mins',
                            50.sp),
                        clockColumnWidget(
                            clockController.seconds.toString() + '',
                            'secs',
                            50.sp),
                      ],
                    ),
                  ),
                  SizedBox(width: kSizedBox - 5),
                  Container(
                    constraints: BoxConstraints(maxWidth: 140.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'to launch',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: kSmallText,
                            fontFamily: kFreudFont,
                          ),
                        ),
                        Text(
                          clockController.description.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: kBigText,
                            fontFamily: kFreudFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

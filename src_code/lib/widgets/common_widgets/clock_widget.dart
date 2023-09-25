import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stellarhub/controller/common_controllers/clock_controller.dart';

import '../../utilities/constants.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ClockController clockController = Get.find();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
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
                            time: '${clockController.hours}:',
                            timeDetails: 'hours',
                            font: 50.sp,
                          ),
                          clockColumnWidget(
                            time: '${clockController.minutes}:',
                            timeDetails: 'mains',
                            font: 50.sp,
                          ),
                          clockColumnWidget(
                            time: '${clockController.seconds}',
                            timeDetails: 'secs',
                            font: 50.sp,
                          ),
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
}

Column clockColumnWidget(
    {required String time, required String timeDetails, required double font}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        time,
        style: TextStyle(
          fontSize: font,
          fontFamily: kSpaceFont,
        ),
      ),
      Transform.translate(
        offset: Offset(0, -10.h),
        child: Text(
          timeDetails,
          style: TextStyle(
            color: kGrey,
            fontSize: 15.sp,
            fontFamily: kFreudFont,
          ),
        ),
      ),
    ],
  );
}

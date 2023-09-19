import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utilities/constants.dart';
import '../../controller/index_controllers/nav_index_controller.dart';

class ViewAllHeaderWidget extends StatelessWidget {
  final String title;
  final int? index;
  final String? destinationRoute;
  final bool useNavigation;

  const ViewAllHeaderWidget({
    super.key,
    required this.title,
    this.index,
    this.destinationRoute,
    this.useNavigation = false,
  });

  @override
  Widget build(BuildContext context) {
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
                  13.sp,
                  kFreudFont,
                ),
              ),
              kForwardIcon,
            ],
          ),
        ),
      ],
    );
  }
}

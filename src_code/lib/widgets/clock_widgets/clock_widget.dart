import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import 'clock_column_widget.dart';

Container clockWidget() {
  return Container(
    height: 74.h,
    decoration: BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            clockColumnWidget('02:', 'hours', 50.sp),
            clockColumnWidget('34:', 'mins', 50.sp),
            clockColumnWidget('51', 'secs', 50.sp)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'to launch',
              style: TextStyle(
                fontSize: kSmallText,
                fontFamily: kFreudFont,
              ),
            ),
            Text(
              'SpaceX',
              style: TextStyle(
                fontSize: kBigText,
                fontFamily: kFreudFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

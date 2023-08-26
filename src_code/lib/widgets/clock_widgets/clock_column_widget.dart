import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

Column clockColumnWidget(String time, String timeDetails, double font) {
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

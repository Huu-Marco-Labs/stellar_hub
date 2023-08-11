import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

Column clockColumnWidget(String time, String timeDetails, double font) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: font,
              fontFamily: kSpaceFont,
            ),
          ),
          Positioned(
            top: 45.h,
            right: 19.w,
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
      ),
    ],
  );
}

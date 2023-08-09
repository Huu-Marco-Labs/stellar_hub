import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

AppBar buildAppBarWidget(String title, String subTitle) {
  return AppBar(
    backgroundColor: kSecondaryColor,
    toolbarHeight: 100.h,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kDefaultText(30.sp, kSpaceFont),
          ),
          Text(
            subTitle,
            style: kLowWeightText(16.sp, kFreudFont),
          ),
        ],
      ),
    ),
  );
}

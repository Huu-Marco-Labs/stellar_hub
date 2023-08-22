import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';

SliverAppBar sliverAppBarWidget(String title, String subTitle) {
  return SliverAppBar(
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
            style: kLowWeightText(18.sp, kFreudFont),
          ),
        ],
      ),
    ),
  );
}

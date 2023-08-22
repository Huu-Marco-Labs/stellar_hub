import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';

AppBar appBarWidget(String title) {
  return AppBar(
    backgroundColor: kSecondaryColor,
    title: Container(
      margin: EdgeInsets.only(top: kDefaultMargin),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
      child: Text(
        title,
        style: kDefaultText(30.sp, kSpaceFont),
      ),
    ),
  );
}

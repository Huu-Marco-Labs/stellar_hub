import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Colors----------------------------------------
const Color kPrimaryColor = Color(0xFFDFD8E3);
const Color kSecondaryColor = Colors.black;
const Color kGrey = Colors.grey;

// Icons-----------------------------------------
Icon kForwardIcon = Icon(
  Icons.arrow_forward_ios_outlined,
  color: kGrey,
  size: 30.w,
);

// Fonts-----------------------------------------
const String kSpaceFont = 'Space';
const String kFreudFont = 'Freud';

// Values----------------------------------------
class AppConstants {
  static double get halfScreenWidth => ScreenUtil().screenWidth / 2;
  static double get halfScreenHeight => ScreenUtil().screenHeight / 2;
}

const double kBorderRadius = 20;
const double kBorderFullRadius = 55;
double kNavWidth = 24.w;
double kNavHeight = 24.h;
double kDefaultPadding = 10.w;
double kDefaultMargin = 17.5.w;
double kBigText = 20.sp;
double kSmallText = 15.sp;
double kSizedBox = 15.h;
double kSizedBoxEnd = 150.h;

// Text Styles-----------------------------------

TextStyle kDefaultText(double fontSize, String fontFamily,
    {Color color = kPrimaryColor}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: fontFamily,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle kBoldText(double fontSize, String fontFamily,
    {Color color = kPrimaryColor}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle kLowWeightText(double fontSize, String fontFamily) {
  return TextStyle(
    color: kGrey,
    fontSize: fontSize,
    fontFamily: fontFamily,
    overflow: TextOverflow.ellipsis,
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector buttonIconWidget(String image) {
  return GestureDetector(
    onTap: () {},
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/icons/rectangle.png',
          height: 100.h,
        ),
        Image.asset(
          'assets/images/icons/$image.png',
          height: 60.h,
        ),
      ],
    ),
  );
}

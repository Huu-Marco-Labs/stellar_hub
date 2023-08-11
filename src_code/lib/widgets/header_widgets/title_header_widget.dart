import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

Padding titleHeaderWidget() {
  return Padding(
    padding:
    EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore',
          style: kDefaultText(30.sp, kSpaceFont),
        ),
        Text(
          'The Universe',
          style: kLowWeightText(16.sp, kFreudFont),
        )
      ],
    ),
  );
}
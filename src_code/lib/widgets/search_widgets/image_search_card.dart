import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

Row imageSearchCard() {
  return Row(
    children: [
      Expanded(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/idk.png',
              width: 153.w,
              height: 105.h,
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 260.w,
                height: 104.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Image',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          '2d ago',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSizedBox),
                    Container(
                      margin: EdgeInsets.only(right: kDefaultPadding * 9),
                      child: Text(
                        'Lunar Halo over\nSnowy Trees',
                        style: kBoldText(
                          kSmallText,
                          kFreudFont,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
